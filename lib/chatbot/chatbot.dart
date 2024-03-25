import 'dart:convert';
//import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _chatMessages = [];

  @override
  void initState() {
    super.initState();
  }

  Future<String> getChatbotResponse(String userInput) async {
    final response =
        await http.get(Uri.parse('http://192.168.1.3:8080/get?msg=$userInput'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      try {
        // Parse the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        return data['response'];
      } catch (e) {
        print('Error decoding JSON: $e');
        return response.body;
      }
      /* Map<String, dynamic> data = jsonDecode(response.body);
      return data['response']; */
    } else {
      throw Exception('Failed to get chatbot response');
    }
  }

  /*  Future<String> getBotResponse(String input) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.3:8080/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'input': input}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['response'];
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
 */
  /* void runModel(String inputText) async {
    // Convert input text to bytes
    List<int> inputBytes = preprocessInput(inputText);

    try {
      // Run inference on input bytes
      var output = await Tflite.runModelOnBinary(
        binary: Uint8List.fromList(inputBytes),
      );

      var finalOutput = postprocessOutput(output!);

      if (finalOutput != null && output.isNotEmpty) {
        setState(() {
          _chatMessages.add(output[0]['label']);
        });
      } else {
        print('Error: Model output is null or empty');
      }
    } catch (e) {
      print('Error running model: $e');
    }
  }

  List<int> preprocessInput(String inputText) {
    // Tokenize input text by splitting into words
    //List<String> tokens = inputText.toLowerCase().split(' ');

    // Encode tokens into bytes using UTF-8 encoding
    List<int> inputBytes = utf8.encode(inputText);

    return inputBytes;
  }

  String decodeResponse(List<dynamic> tokens) {
    // Reverse the encoding to map token indices to words
    List<String?> words =
        tokens.map((index) => reverse_target_features_dict[index]).toList();

    // Join the words to form the response sentence
    String response = words.join(' ');

    return response;
  }

  String postprocessOutput(List<dynamic> output) {
    // Decode model output tokens into a response sentence
    List<dynamic> tokenIndices =
        output.map((element) => element['index']).toList();
    String response = decodeResponse(tokenIndices);

    return response;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chatMessages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    _chatMessages.add(_controller.text);
                    _chatMessages.add(//await getBotResponse(_controller.text)
                        await getChatbotResponse(_controller.text));
                    setState(() {});
                    // runModel(_controller.text);
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
