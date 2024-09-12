import 'package:flutter/material.dart';
import 'package:gemini_chatbot/core/routing/routes.dart';
import 'package:gemini_chatbot/features/chat/ui/pages/chat_page.dart';

import '../../features/onboarding/onboarding_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const Onboarding(),
        );
      case Routes.geminiChatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
