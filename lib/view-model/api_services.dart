import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:snapsense/view-model/api_links.dart';

class PromptRepo {
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer ${ApiLinks.apiKey}',
        'accept': 'image/*'
      };

      // Form payload
      FormData formData = FormData.fromMap({
        'prompt': prompt,
        'output_format': 'webp',
      });

      // Dio instance with required headers and response type
      Dio dio = Dio();
      dio.options =
          BaseOptions(headers: headers, responseType: ResponseType.bytes);

      // Make the API request
      final response = await dio.post(ApiLinks.endpoint, data: formData);
      if (response.statusCode == 200) {
        Uint8List uint8List = Uint8List.fromList(response.data);
        log("Image generated successfully!");
        return uint8List;
      } else {
        log("Failed to generate image: ${response.statusCode}");
        log(response.data.toString());
        return null;
      }
    } catch (e) {
      log("Error occurred: $e");
      return null;
    }
  }
}
