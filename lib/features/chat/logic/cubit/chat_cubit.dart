import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../data/models/message.dart';
import '../../data/repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatInitial()) {
    emit(ChatLoaded([]));
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    List<Message> currentMessages = [];

    if (state is ChatLoaded) {
      currentMessages = (state as ChatLoaded).messages;
    }

    emit(ChatLoading(messages: List.from(currentMessages)));

    try {
      final response = await _chatRepository.getResponse(text);

      final newMessages = [
        ...currentMessages,
        Message(text: text, isUser: true),
        Message(text: response, isUser: false),
      ];

      emit(ChatLoaded(newMessages));
    } catch (e) {
      log(e.toString());
    }
  }
}
