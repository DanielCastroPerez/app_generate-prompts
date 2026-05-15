import 'package:generate_promps/data/models/generate_prom_model.dart';

abstract class PrompRemoteDatasource {
  Future<GeneratePromModel> getresponse();
  Future<GeneratePromModel> postPromp();
}
