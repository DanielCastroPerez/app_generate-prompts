import 'package:generate_promps/domain/entities/config.dart';

class ConfigModel extends ConfigEntity {
  ConfigModel({required super.modelTarget, required super.temperature});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      modelTarget: json["model_target"],
      temperature: json["temperature"],
    );
  }
  Map<String, dynamic> toJson() => {
    "model_target": modelTarget,
    "temperature": temperature,
  };
}
