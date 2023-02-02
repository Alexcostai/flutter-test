import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key, required this.callback});
  final Function(String) callback;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onClick() {
    if (controller.text.isNotEmpty) {
      widget.callback(controller.text);
      controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.message),
          labelText: "Type a message:",
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            splashColor: Colors.white,
            tooltip: "Post Message",
            onPressed: onClick,
          )),
    );
  }
}
