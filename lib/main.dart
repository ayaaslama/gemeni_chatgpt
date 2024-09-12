import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_chatbot/core/routing/app_router.dart';
import 'package:gemini_chatbot/gemini_chat.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(GeminiChat(
    appRouter: AppRouter(),
  ));
}
