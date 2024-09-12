import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;

  const TextInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          hintText: 'Write your message',
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
