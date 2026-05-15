import 'package:generate_promps/domain/entities/prom_data.dart';

class PrompDataModel extends PromptDataEntity {
  PrompDataModel({
    required super.role,
    required super.task,
    required super.context,
    required super.constraints,
    required super.questionsForAi,
  });

  factory PrompDataModel.fromJson(Map<String, dynamic> json) {
    return PrompDataModel(
      role: json["role"],
      task: json["task"],
      context: json["context"],
      constraints: json["constraints"],
      questionsForAi: json["questions_for_ai"],
    );
  }

  Map<String, dynamic> toJson() => {
    "role": role,
    "task": task,
    "context": context,
    "constraints": constraints,
    "questions_for_ai": questionsForAi,
  };
}
