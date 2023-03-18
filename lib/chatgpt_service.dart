import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String apiKey;
  final String apiUrl = 'https://api.openai.com/v1/engines/davinci-codex/completions';

  ChatGPTService({required this.apiKey});

  Future<String> generateResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt,
        'max_tokens': 150,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to generate response');
    }
  }
}
