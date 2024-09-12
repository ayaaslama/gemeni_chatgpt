import 'package:flutter/material.dart';

import '../../data/models/message.dart';
import 'message_tile.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final ScrollController scrollController;

  const MessageList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageTile(message: message);
      },
    );
  }
}
