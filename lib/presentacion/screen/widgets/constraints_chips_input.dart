import 'package:flutter/material.dart';

class ConstraintsChipsInput extends StatefulWidget {
  final List<String> constraints;
  final Function(List<String>) onConstraintsChanged;

  const ConstraintsChipsInput({
    super.key,
    required this.constraints,
    required this.onConstraintsChanged,
  });

  @override
  State<ConstraintsChipsInput> createState() => _ConstraintsChipsInputState();
}

class _ConstraintsChipsInputState extends State<ConstraintsChipsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addConstraint() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !widget.constraints.contains(text)) {
      final updatedList = [...widget.constraints, text];
      widget.onConstraintsChanged(updatedList);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Constraints (Press + or Enter to add)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: "Add constraint...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.deepPurple),
              onPressed: _addConstraint,
            ),
          ),
          onSubmitted: (_) => _addConstraint(),
        ),
        const SizedBox(height: 10.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: widget.constraints.map((constraint) {
            return Chip(
              label: Text(constraint),
              onDeleted: () {
                final updatedList = widget.constraints.where((c) => c != constraint).toList();
                widget.onConstraintsChanged(updatedList);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}