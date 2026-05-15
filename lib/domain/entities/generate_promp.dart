import 'package:generate_promps/domain/entities/config.dart';
import 'package:generate_promps/domain/entities/prom_data.dart';

class GeneratePrmpEntity {
  final String userId;
  final ConfigEntity config;
  final PromptDataEntity promptdata;

  GeneratePrmpEntity({
    required this.userId,
    required this.config,
    required this.promptdata,
  });
}


// { 
//   "user_id": "string",
//   "config": { Esto es un objeto
//     "model_target": "gemini-2.5-flash", debo cambiar 
//     "temperature": 0.7
//   },
//   "prompt_data": { Esto es un objeto
//     "role": "string",
//     "task": "string",
//     "context": "string",
//     "constraints": [],
//     "questions_for_ai": false
//   }
// 

// Entity para el envío (Request)

// class PromptConfig {
//   final String userId;
//   final AIConfig config;
//   final PromptData promptData;

//   PromptConfig({
//     required this.userId,
//     required this.config,
//     required this.promptData,
//   });
// }

// class AIConfig {
//   final String modelTarget;
//   final double temperature;

//   AIConfig({required this.modelTarget, required this.temperature});
// }

// class PromptData {
//   final String role;
//   final String task;
//   final String context;
//   final List<String> constraints;
//   final bool questionsForAi;

//   PromptData({
//     required this.role,
//     required this.task,
//     required this.context,
//     required this.constraints,
//     required this.questionsForAi,
//   });
// }

// // Entity para la respuesta (Response)
// class OptimizationResult {
//   final String status;
//   final String originalPrompt;
//   final String optimizedPrompt;
//   final String explanation;

//   OptimizationResult({
//     required this.status,
//     required this.originalPrompt,
//     required this.optimizedPrompt,
//     required this.explanation,
//   });
// }

// class AIConfigModel extends AIConfig {
//   AIConfigModel({required String modelTarget, required double temperature})
//       : super(modelTarget: modelTarget, temperature: temperature);

//   Map<String, dynamic> toJson() => {
//         "model_target": "gemini-2.5-flash", // Valor actualizado según tu instrucción
//         "temperature": temperature,
//       };
// }

// class PromptDataModel extends PromptData {
//   PromptDataModel({
//     required String role,
//     required String task,
//     required String context,
//     required List<String> constraints,
//     required bool questionsForAi,
//   }) : super(
//           role: role,
//           task: task,
//           context: context,
//           constraints: constraints,
//           questionsForAi: questionsForAi,
//         );

//   Map<String, dynamic> toJson() => {
//         "role": role,
//         "task": task,
//         "context": context,
//         "constraints": constraints,
//         "questions_for_ai": questionsForAi,
//       };
// }

// class OptimizationResultModel extends OptimizationResult {
//   OptimizationResultModel({
//     required String status,
//     required String originalPrompt,
//     required String optimizedPrompt,
//     required String explanation,
//   }) : super(
//           status: status,
//           originalPrompt: originalPrompt,
//           optimizedPrompt: optimizedPrompt,
//           explanation: explanation,
//         );

//   factory OptimizationResultModel.fromJson(Map<String, dynamic> json) {
//     return OptimizationResultModel(
//       status: json['status'] ?? '',
//       originalPrompt: json['original_prompt'] ?? '',
//       optimizedPrompt: json['optimized_prompt'] ?? '',
//       explanation: json['explanation'] ?? '',
//     );
//   }
// }