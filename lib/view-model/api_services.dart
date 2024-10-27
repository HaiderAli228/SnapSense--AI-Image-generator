import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:snapsense/view-model/api_links.dart';

class PromptRepo {
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer ${ApiLinks.postApiEndPoint}'
      };

      Map<String, dynamic> payload = {
        'prompt': prompt,
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '5',
        'seed': '1',
        'high_res_results': '1'
      };

      FormData formData = FormData.fromMap(payload);

      Dio dio = Dio();
      dio.options =
          BaseOptions(headers: headers, responseType: ResponseType.bytes);

      final response = await dio.post(ApiLinks.baseUrl, data: formData);
      if (response.statusCode == 200) {
        log(response.data.runtimeType.toString());
        log(response.data.toString());
        Uint8List uint8List = Uint8List.fromList(response.data);
        return uint8List;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
//Generate a Disney image of a princess with a prince
