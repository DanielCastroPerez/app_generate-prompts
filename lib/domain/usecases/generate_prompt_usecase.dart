import 'package:generate_promps/domain/entities/generate_promp.dart';
import 'package:generate_promps/domain/entities/promp_response.dart';
import 'package:generate_promps/domain/repositories/promp_repositories.dart';


class GeneratePromptUseCase{
  final PrompRepository repository;
  
  GeneratePromptUseCase({
    required this.repository
  });

  Future <PromptResponseEntity> call(GeneratePromptEntity prompt) async {
    return await repository.getResponse(prompt);
  }
}