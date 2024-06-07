import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindcare_app/chatbot/chatbot_controller.dart';

class ChatBotScreen extends GetView<ChatController> {
  static String id = "/chatbot";

  final TextEditingController _controller = TextEditingController();
  final ChatController chat = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Row(
          children: [
            const Spacer(),
            const Text(
              'Panadora',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Lottie.asset(
                  "assets/animation/chatbot.json",
                  height: 45,
                  width: 45,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF3B63A8),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  reverse: true,
                  itemCount: controller.chatHistory.length,
                  itemBuilder: (context, index) {
                    var item = controller.chatHistory[index];
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: BubbleSpecialOne(
                          text: item['user'],
                          isSender: true,
                          color: const Color(0xFF3B63A8),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: BubbleSpecialOne(
                          text: item['chatbot'],
                          isSender: false,
                          color: const Color(0xFFD5D5D5),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: 5,
                minLines: 1,
                controller: _controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  hintText: "Send message",
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xFF3B63A8),
                    ),
                    onPressed: () async {
                      var message = _controller.text;
                      if (message.isNotEmpty) {
                        await controller.getChatbotResponse(message);
                        _controller.clear();
                      }
                    },
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B63A8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B63A8)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
