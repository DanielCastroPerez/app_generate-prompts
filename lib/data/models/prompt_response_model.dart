import 'package:generate_promps/domain/entities/prompt_response.dart';

// esta clase se crea por que la respuesta que nos manda la api 
//despues de darle las tareas etc la api nos debuelve un json(modelo) diferente

class PromptResponseModel extends PromptResponseEntity{
  PromptResponseModel({
    required super.status,
    required super.originalPrompt,
    required super.optimizedPrompt,
    required super.explanation,
  }) ;

  factory PromptResponseModel.fromJson(Map <String,dynamic> json){
    return PromptResponseModel(
      status: json["status"], 
      originalPrompt: json["original_prompt"], 
      optimizedPrompt: json["optimized_prompt"], 
      explanation: json["explanation"]);
  }

  Map<String,dynamic> toJson()=>{
    "status":status,
    "original_prompt":originalPrompt,
    "optimized_prompt":optimizedPrompt,
    "explanation": explanation,
  };
}