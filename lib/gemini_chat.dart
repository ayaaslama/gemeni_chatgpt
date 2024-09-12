import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_chatbot/core/routing/app_router.dart';
import 'package:gemini_chatbot/core/theme/theme_notifier.dart';
import 'package:gemini_chatbot/core/theme/themes.dart';
import 'package:gemini_chatbot/features/chat/data/repositories/chat_repository.dart';
import 'package:gemini_chatbot/features/chat/logic/cubit/chat_cubit.dart';

import 'core/routing/routes.dart';

class GeminiChat extends StatelessWidget {
  final AppRouter appRouter;

  const GeminiChat({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        RepositoryProvider(
          create: (context) => ChatRepository(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(
            context.read<ChatRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.onBoardingScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
