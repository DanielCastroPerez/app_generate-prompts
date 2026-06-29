import 'package:flutter/material.dart';
import 'package:generate_promps/presentacion/screen/widgets/prompt_form.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prompt Generator"),
      ),
      body: const PromptForm(),   

      
    );
  }
}