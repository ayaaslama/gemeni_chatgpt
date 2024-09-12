import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message.dart';
import '../../logic/cubit/chat_cubit.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_list.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const ChatAppBar(),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
          }
        },
        builder: (context, state) {
          List<Message> messages = [];

          if (state is ChatLoading) {
            messages = state.messages;
          } else if (state is ChatLoaded) {
            messages = state.messages;
          }

          return Column(
            children: [
              Expanded(
                child: MessageList(
                  messages: messages,
                  scrollController: scrollController,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    bottom: 32, top: 16.0, left: 16.0, right: 16),
                child: ChatInput(),
              ),
            ],
          );
        },
      ),
    );
  }
}
