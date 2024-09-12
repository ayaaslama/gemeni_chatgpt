import 'package:flutter/material.dart';

import '../../data/models/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.isUser
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            borderRadius: message.isUser
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
          ),
          child: Text(
            message.text,
            style: message.isUser
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
