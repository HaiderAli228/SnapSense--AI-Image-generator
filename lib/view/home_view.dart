import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController controller = TextEditingController();

  final PromptBloc promptBloc = PromptBloc();

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Images🚀"),
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PromptGeneratingImageLoadState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PromptGeneratingImageErrorState) {
            return const Center(child: Text("Something went wrong"));
          } else if (state is PromptGeneratingImageSuccessState) {
            final successState = state;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(successState.uint8list),
                      ),
                    ),
                  ),
                ),
                buildPromptInputSection(),
              ],
            );
          } else {
            // Default state: Show input section when no image has been generated yet
            return buildPromptInputSection();
          }
        },
      ),
    );
  }

  // Helper widget for the input section
  Widget buildPromptInputSection() {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter your prompt",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            cursorColor: Colors.deepPurple,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            width: double.maxFinite,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  promptBloc.add(PromptEnteredEvent(prompt: controller.text));
                }
              },
              icon: const Icon(Icons.generating_tokens),
              label: const Text("Generate"),
            ),
          ),
        ],
      ),
    );
  }
}
