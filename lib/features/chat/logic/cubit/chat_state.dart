part of 'chat_cubit.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {
  final List<Message> messages;

  ChatLoading({required this.messages});
}

final class ChatLoaded extends ChatState {
  final List<Message> messages;

  ChatLoaded(this.messages);
}
