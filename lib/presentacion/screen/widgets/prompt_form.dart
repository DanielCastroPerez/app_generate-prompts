import 'package:flutter/material.dart';
import 'package:generate_promps/presentacion/screen/widgets/constraints_chips_input.dart';

class PromptForm extends StatefulWidget {
  const PromptForm({super.key});

  @override
  State<PromptForm> createState() => _PromptFormState();
}

class _PromptFormState extends State<PromptForm> {
  final List<String> _geminiModels = [
    'gemini-2.5-flash',
    'gemini-2.5-pro',
    'gemini-1.5-flash',
  ];
  String? _selectedModel;
  double _currentTemperature = 0.7;
  bool _questionsForAi = false;
  List<String> _constraintsList = [];

  late final TextEditingController _roleController;
  late final TextEditingController _taskController;
  late final TextEditingController _contextController;

  @override
  void initState() {
    super.initState();
    _selectedModel = _geminiModels.first;
    _roleController = TextEditingController();
    _taskController = TextEditingController();
    _contextController = TextEditingController();
  }

  @override
  void dispose() {
    _roleController.dispose();
    _taskController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedModel,
              decoration: InputDecoration(
                labelText: "Target Model",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.layers),
              ),

              items: _geminiModels
                  .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedModel = val),
            ),
            Text(_selectedModel.toString()),

            SizedBox(height: 20.0),

            Text(
              "Temperature: ${_currentTemperature.toStringAsFixed(1)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Slider(
              value: _currentTemperature,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: _currentTemperature.toString(),
              onChanged: (val) => setState(() => _currentTemperature = val),
            ),
            const SizedBox(height: 10.0),

            SwitchListTile(
              title: Text("Make questions for IA"),
              subtitle: Text("Allow the IA to ask clarification questions"),
              value: _questionsForAi,
              contentPadding: EdgeInsets.zero,

              onChanged: (val) => setState(() {
                _questionsForAi = val;
              }),
            ),

            SizedBox(height: 15.0),

            _buildTextField(
              controller: _roleController,
              label: "Role",
              icon: Icons.person,
            ),

            const SizedBox(height: 17.0),

            _buildTextField(
              controller: _taskController,
              label: "Task",
              icon: Icons.assignment,
            ),

            const SizedBox(height: 17.0),

            _buildTextField(
              controller: _contextController,
              label: "Context",
              icon: Icons.description,
              maxLines: 3,
            ),

            const SizedBox(height: 17.0),

            ConstraintsChipsInput(
              constraints: _constraintsList,
              onConstraintsChanged: (newList) =>
                  setState(() => _constraintsList = newList),
            ),

            SizedBox(height: 30.0),
                    SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            icon: Icon(Icons.bolt),
            label: const Text(
              "Optimizar Prompt",
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              final model = _selectedModel  ?? 'gemini-2.5-flash';
              final temp = _currentTemperature;
              final roleText = _roleController;
              final taslText = _taskController;
              final contextText = _contextController;
            },
          ),
        ),
          ],
        ),
      ),
    );
  }
}

// Helper limpio para TextFields repetitivo
Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  int maxLines = 1,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.5)),
      suffixIcon: IconButton(
        onPressed: () => controller.clear(),
        icon: Icon(Icons.clear),
      ),
    ),
  );
}
