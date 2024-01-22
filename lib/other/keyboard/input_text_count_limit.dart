import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class TextCountLimitPage extends StatefulWidget {
  const TextCountLimitPage({super.key});

  @override
  State<TextCountLimitPage> createState() => _TextCountLimitPageState();
}

class _TextCountLimitPageState extends State<TextCountLimitPage> {

  TextEditingController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
    _controller?.addListener(() {
      print(_controller?.text ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(title: Text('字数限制'),),
        body: Center(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter the icon path',
              constraints: const BoxConstraints.tightFor(
                width: 300,
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
            ],
          ),
        ),
      ),
    );
  }
}
