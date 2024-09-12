import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/chat_cubit.dart';

class SendButton extends StatelessWidget {
  final TextEditingController controller;

  const SendButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final isLoading = state is ChatLoading;
        return isLoading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  child: Image.asset('assets/images/send.png'),
                  onTap: () {
                    final text = controller.text.trim();
                    if (text.isNotEmpty) {
                      context.read<ChatCubit>().sendMessage(text);
                      controller.clear();
                    }
                  },
                ),
              );
      },
    );
  }
}
