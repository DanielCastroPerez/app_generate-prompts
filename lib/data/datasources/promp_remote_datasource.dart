import 'dart:convert';
import 'package:generate_promps/data/models/generate_prom_model.dart';
import 'package:generate_promps/data/models/promp_response_model.dart';
import 'package:http/http.dart' as http;

abstract class PrompRemoteDatasource {
  Future<PromptResponseModel> getResponse(GeneratePromModel prompt);
}

class PromptRemoteDatasourceImpl extends PrompRemoteDatasource {
  final http.Client cliente;
  final String baseUrl;

  PromptRemoteDatasourceImpl({
    required this.cliente, 
    required this.baseUrl,
  });

  @override
  Future<PromptResponseModel> getResponse(GeneratePromModel prompt) async {
    try {
      final response = await cliente.post(
        Uri.parse("$baseUrl/optimize"), 
        headers: {
          'Content-Type': 'application/json', 
        },
        body: jsonEncode(prompt.toJson()), 
      );

      if (response.statusCode == 200) {
        // Como es un solo objeto {}, lo pasamos directo como un Map porque es un Json
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        
        // Devolvemos un solo objeto PromptResponseModel y lo combierto a JSON con fromJson
        return PromptResponseModel.fromJson(jsonMap);
      } else {
        // Manejo de errores HTTP 
        throw Exception("Error en el servidor: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Error de conexión: $e");
    }
  }
}