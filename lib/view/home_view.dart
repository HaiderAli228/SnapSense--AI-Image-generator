// screens/prompt_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../view-model/prompt_viewmodel.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({Key? key}) : super(key: key);

  @override
  _PromptScreenState createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final TextEditingController _controller = TextEditingController();
  List<types.Message> messages = [];

  void _onSend(types.PartialText message) {
    final viewModel = Provider.of<PromptViewModel>(context, listen: false);
    messages.add(types.TextMessage(
      id: DateTime.now().toString(),
      author: const types.User(id: 'user'),
      text: message.text,
    ));
    viewModel.submitPrompt(message.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Generator')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PromptViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.generatedImageUrl != null) {
                  messages.add(types.ImageMessage(
                    id: DateTime.now().toString(),
                    author: const types.User(id: 'bot'),
                    uri: viewModel.generatedImageUrl!,
                    size: 1000,
                    name: 'Generated Image',
                  ));
                } else if (viewModel.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(viewModel.errorMessage!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                return Chat(
                  messages: messages,
                  onSendPressed: _onSend,
                  user: const types.User(id: 'user'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter prompt...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _onSend(types.PartialText(text: _controller.text));
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
}
