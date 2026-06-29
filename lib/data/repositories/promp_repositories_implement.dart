import 'package:generate_promps/data/datasources/promp_remote_datasource.dart';
import 'package:generate_promps/data/models/config_model.dart';
import 'package:generate_promps/data/models/generate_prom_model.dart';
import 'package:generate_promps/data/models/promp_data_model.dart';
import 'package:generate_promps/domain/entities/generate_promp.dart';
import 'package:generate_promps/domain/entities/promp_response.dart';
import 'package:generate_promps/domain/repositories/promp_repositories.dart';

class PromptRepositoryImpl implements PrompRepository {
  final PrompRemoteDatasource remoteDatasource;

  PromptRepositoryImpl({
    required this.remoteDatasource,
  });
  
  @override
  Future<PromptResponseEntity> getResponse(GeneratePromptEntity prompt) async {
    try {
      final configModel = ConfigModel(
        modelTarget: prompt.config.modelTarget,
        temperature: prompt.config.temperature,
      );

      final promptDataModel = PrompDataModel(
        role: prompt.promptData.role,
        task: prompt.promptData.task,
        context: prompt.promptData.context,
        constraints: prompt.promptData.constraints,
        questionsForAi: prompt.promptData.questionsForAi,
      );

      final generatePromModel = GeneratePromModel(
        userId: prompt.userId,
        config: configModel,
        promptData: promptDataModel,
      );

      final prompResponse = await remoteDatasource.getResponse(generatePromModel);
      
      return prompResponse;
      
    } catch (e) {
      throw Exception("Error en el repositorio: $e");
    }
  }
}