# -*- coding: utf-8 -*-
"""Graduation_project _dep.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1CwGN7KRm_YYMFtopaJuUVSnaDE1q_C8S
"""

pip install openai==0.28

import nltk
nltk.download('punkt')

import nltk
nltk.download('wordnet')

import nltk
import pickle
import numpy as np
from keras.models import load_model
import json
import random
import string
from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

# Load Keras model and intents
keras_model = load_model('/content/drive/MyDrive/AI-Therapist-Project-main/model.h5')
intents = json.loads(open('/content/drive/MyDrive/AI-Therapist-Project-main/intents.json').read())
words = pickle.load(open('/content/drive/MyDrive/AI-Therapist-Project-main/texts.pkl','rb'))
classes = pickle.load(open('/content/drive/MyDrive/AI-Therapist-Project-main/labels.pkl','rb'))

# NLTK lemmatizer
lemmatizer = nltk.stem.WordNetLemmatizer()

# Define responses for greeting and ending chat
greeting_responses = ["Hi there!", "Hello!", "Greetings!", "Hola","hi","How can I assist you today?"]
end_chat_responses = ["Goodbye!", "See you later!", "Have a great day!", "Bye!"]

# Functions for text preprocessing
def clean_up_sentence(sentence):
    # Remove punctuation from the sentence
    sentence = sentence.translate(str.maketrans('', '', string.punctuation))
    # Convert the sentence to lowercase
    sentence = sentence.lower()
    # Remove extra spaces
    sentence = ' '.join(sentence.split())
    # Tokenize the sentence
    sentence_words = nltk.word_tokenize(sentence)
    # Lemmatize each word in the sentence
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words

def bow(sentence, words, show_details=True):
    sentence_words = clean_up_sentence(sentence)
    bag = [0]*len(words)
    for s in sentence_words:
        for i,w in enumerate(words):
            if w == s:
                bag[i] = 1
                if show_details:
                    print ("found in bag: %s" % w)
    return(np.array(bag))

# Keras model prediction
def predict_class(sentence, model):
    p = bow(sentence, words, show_details=False)
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i,r] for i,r in enumerate(res) if r>ERROR_THRESHOLD]
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = [{"intent": classes[r[0]], "probability": str(r[1])} for r in results]
    return return_list

# Get response based on intent
def get_response(ints, intents_json, user_input):
    if not ints:
        return "I'm sorry, I'm not sure how to respond to that."

    tag = ints[0]['intent']
    list_of_intents = intents_json['intents']
    relevant_responses = []

    for intent in list_of_intents:
        if intent['tag'] == tag:
            # Check if any pattern matches the user input
            for pattern in intent['patterns']:
                if pattern.lower() in user_input.lower():
                    relevant_responses.extend(intent['responses'])
                    break

    # Exclude the first response if it's random and strange
    if relevant_responses and len(relevant_responses) > 1:
        if "random" in relevant_responses[0].lower() or "strange" in relevant_responses[0].lower():
            relevant_responses = relevant_responses[1:]

    # If there are relevant responses, randomly select one
    if relevant_responses:
        return random.choice(relevant_responses)
    else:
        # If no relevant responses found, return a generic response
        return "I'm sorry, I'm not sure how to respond to that."

# Chatbot response function combining both models
def chatbot_response(user_input):
    # Use Keras model to predict intent
    keras_intents = predict_class(user_input, keras_model)

    # Get response based on intent
    response = get_response(keras_intents, intents, user_input)

    # Return the response
    if response == "I'm sorry, I'm not sure how to respond to that.":
        # If the Keras model didn't find a relevant response, use GPT-3 model
        openai.api_key = "api_key"
        prompt = f"User: {user_input}\nChatBot:"
        response = openai.Completion.create(
            engine="gpt-3.5-turbo-instruct",
            prompt=prompt,
            max_tokens=100
        )
        return response.choices[0].text.strip()
    else:
        return response

# Command-line interface for interacting with the chatbot
def start_chat():
    print(random.choice(greeting_responses))
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["quit", "exit", "stop","bye","goodbye","see you later","end","see you ", "see you soon"]:
            print(random.choice(end_chat_responses))
            break
        response = chatbot_response(user_input)
        print("Bot:", response)

# Flask routes
@app.route("/get", methods=["POST"])
def get_bot_response():
    user_text = request.json['msg']

    # Use Keras model to predict intent
    keras_intents = predict_class(user_text, keras_model)

    # Get response based on intent
    response = get_response(keras_intents, intents, user_text)

    # Return the response
    return jsonify({'response': response})

if __name__ == '__main__':
    #print(random.choice(greeting_responses))
    #app.run(debug=True, port=5000)
    start_chat()

start_chat()