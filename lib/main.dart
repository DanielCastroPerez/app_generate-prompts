import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:generate_promps/data/datasources/promp_remote_datasource.dart';
import 'package:generate_promps/data/repositories/promp_repositories_implement.dart';
import 'package:generate_promps/domain/usecases/generate_prompt_usecase.dart';
import 'package:generate_promps/presentacion/provider/prompt_provider.dart';
import 'package:generate_promps/presentacion/screen/prompt_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final baseUrl = dotenv.env['BASE_URL'] ?? 'http://10.0.2.2:8000';
  final cliente = http.Client();
  final remoteDatasource = PromptRemoteDatasourceImpl(
    cliente: cliente,
    baseUrl: baseUrl,
  );

  final repository = PromptRepositoryImpl(remoteDatasource: remoteDatasource);
  final generatePromptUseCase = GeneratePromptUseCase(repository: repository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => PromptProvider(getResponseUseCase: generatePromptUseCase),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PromptScreen(),
    );
  }
}
