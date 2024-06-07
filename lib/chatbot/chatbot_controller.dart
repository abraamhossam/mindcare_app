import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final TextEditingController _controller = TextEditingController();

  static String? email = FirebaseAuth.instance.currentUser!.email;
  List<QueryDocumentSnapshot> messages = [];

  RxList<Map<String, dynamic>> chatHistory = <Map<String, dynamic>>[].obs;
  CollectionReference chatbot = FirebaseFirestore.instance
      .collection('chatbot_history')
      .doc(email)
      .collection("messages");
  @override
  void onInit() {
    super.onInit();

    getChatHistory();
  }

  Future<void> getChatHistory() async {
    QuerySnapshot data = await chatbot.orderBy("time", descending: true).get();
    messages.addAll(data.docs);
    for (var message in messages) {
      chatHistory.add({
        'user': message["user"],
        'chatbot': message['chatbot'],
      });
      print(chatHistory);
    }
  }

  // Function to send user message to OpenAI's model for response

  Future<void> getChatbotResponse(String message) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.3:8080/get'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'msg': message}),
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      chatbot.add({
        'time': FieldValue.serverTimestamp(),
        'user': message,
        'chatbot': data['response'],
      });
      chatHistory.add({
        'user': message,
        'chatbot': data['response'],
      });
    } else {
      throw Exception('Failed to get chatbot response');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
