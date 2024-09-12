import 'package:flutter/material.dart';
import 'package:gemini_chatbot/features/onboarding/widgets/onboarding_title.dart';

import 'widgets/onboarding_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const OnboardingTitle(),
            const SizedBox(height: 32),
            Image.asset('assets/images/onboarding.png'),
            const SizedBox(height: 32),
            const OnboardingButton(),
          ],
        ),
      ),
    );
  }
}
