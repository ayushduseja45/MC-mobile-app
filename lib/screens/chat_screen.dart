import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Robert Fox")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text("Hello!", style: TextStyle(color: Colors.purple))),
                ListTile(title: Text("Hey! How are you?", textAlign: TextAlign.right)),
                ListTile(title: Text("Did you watch the match?")),
                ListTile(title: Text("Yes, it was great!", textAlign: TextAlign.right)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(decoration: InputDecoration(hintText: "Type a message...")),
                ),
                IconButton(icon: const Icon(Icons.send, color: Colors.purple), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
