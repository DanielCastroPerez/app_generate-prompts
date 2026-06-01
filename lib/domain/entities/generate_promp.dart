import 'package:generate_promps/domain/entities/config.dart';
import 'package:generate_promps/domain/entities/prom_data.dart';

class GeneratePromptEntity {
  final String userId;
  final ConfigEntity config;
  final PromptDataEntity promptData;

  GeneratePromptEntity({
    required this.userId,
    required this.config,
    required this.promptData,
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

