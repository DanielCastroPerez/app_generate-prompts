import 'package:generate_promps/domain/entities/generate_promp.dart';

abstract class PrompRepository {
  Future<GeneratePrmpEntity> getresponse();
  Future<GeneratePrmpEntity> postPromp();
}
