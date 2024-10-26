// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snapsense/model/prompt_request.dart';

class ApiService {
  final String _baseUrl = 'https://hub.mymidjourney.ai/api/v1/midjourney/imagine';
  final String _apiKey = 'your api key here'; // Add your API key here

  Future<String> generateImage(String prompt) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey', // Set the Authorization header
    };

    var request = http.Request('POST', Uri.parse(_baseUrl));
    request.body = json.encode(PromptRequest(prompt: prompt).toJson());
    request.headers.addAll(headers);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final imageUrl = json.decode(responseData)['url'];
        return imageUrl ?? 'Error: Image URL not found in response.';
      } else {
        throw Exception('Failed to generate image: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error generating image: $e');
    }
  }
}
