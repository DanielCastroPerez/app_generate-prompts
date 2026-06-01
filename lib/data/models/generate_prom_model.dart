import 'package:generate_promps/data/models/config_model.dart';
import 'package:generate_promps/data/models/promp_data_model.dart';
import 'package:generate_promps/domain/entities/generate_promp.dart';


class GeneratePromModel extends GeneratePromptEntity {
  GeneratePromModel({
    required super.userId,
    required super.config,
    required super.promptData,
  });

  factory GeneratePromModel.fromJson(Map<String, dynamic> json) {
    return GeneratePromModel(
      userId: json["user_id"] ?? '',
      // Usamos ConfigModel porque es el que tiene el método fromJson
      config: ConfigModel.fromJson(json["config"]), 
      promptData: PrompDataModel.fromJson(json["prompt_data"]), 
    );
  }

  Map<String, dynamic> toJson() => {
    "user_id": userId, 
    "config": (config as ConfigModel).toJson(), 
    "prompt_data": (promptData as PrompDataModel).toJson(), 
  };
}