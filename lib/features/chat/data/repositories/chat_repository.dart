import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatRepository {
  final GenerativeModel _model;

  ChatRepository()
      : _model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: dotenv.env['GOOGLE_API_KEY']!,
        );

  Future<String> getResponse(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text!;
  }
}
