import 'package:flutter/material.dart';
import 'package:generate_promps/domain/entities/generate_promp.dart';
import 'package:generate_promps/domain/entities/promp_response.dart';
import 'package:generate_promps/domain/usecases/generate_prompt_usecase.dart';


enum PromptState { initial, loading, loaded, error }

class PromptProvider extends ChangeNotifier {
  final GeneratePromptUseCase getResponseUseCase;

  PromptResponseEntity? responsePrompt;
  PromptState state = PromptState.initial;
  String? errorMessage;

  PromptProvider({required this.getResponseUseCase});

  Future<void> fetchResponse(GeneratePromptEntity prompt) async {
    state = PromptState.loading;
    notifyListeners();

    try {
      final result = await getResponseUseCase(prompt);
      responsePrompt = result;
      state = PromptState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      state = PromptState.error;
    } finally {
      notifyListeners();
    }
  }
}
