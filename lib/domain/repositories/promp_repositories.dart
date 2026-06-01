import 'package:generate_promps/domain/entities/generate_promp.dart';
import 'package:generate_promps/domain/entities/promp_response.dart';

abstract class PrompRepository {
Future<PromptResponseEntity> getResponse(GeneratePromptEntity prompt);
}

