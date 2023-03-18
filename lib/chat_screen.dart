import 'package:flutter/material.dart';
import 'package:voice_assistant/models/message.dart';
import 'package:voice_assistant/services/chatgpt_service.dart';

class ChatScreen extends StatefulWidget {
  final ChatGPTService chatGPTService;

  ChatScreen({required this.chatGPTService});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(Message(id: DateTime.now().toString(), message: message, isUserMessage: true));
    });
    _textEditingController.clear();

    widget.chatGPTService.generateResponse(message).then((response) {
      setState(() {
        _messages.add(Message(id: DateTime.now().toString(), message: response, isUserMessage: false));
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.message),
                  subtitle: Text(message.isUserMessage ? 'User' : 'ChatGPT'),
                  trailing: message.isUserMessage ? Icon(Icons.send) : null,
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Enter a message...',
                        border: InputBorder.none,
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_textEditingController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
