// viewmodels/prompt_viewmodel.dart

import 'package:flutter/material.dart';

import '../model/api_services.dart';

class PromptViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? generatedImageUrl;
  String? errorMessage;

  Future<void> submitPrompt(String prompt) async {
    try {
      errorMessage = null;
      generatedImageUrl = null;
      notifyListeners();

      final response = await _apiService.generateImage(prompt);
      generatedImageUrl = response;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
