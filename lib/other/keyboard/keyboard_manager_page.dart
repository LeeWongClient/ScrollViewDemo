import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KeyboardManagerPage extends StatefulWidget {
  const KeyboardManagerPage({super.key});

  @override
  State<KeyboardManagerPage> createState() => _KeyboardManagerPageState();
}

class _KeyboardManagerPageState extends State<KeyboardManagerPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(title: Text('键盘管理'),),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 450,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the icon path',
                  constraints: const BoxConstraints.tightFor(
                    width: 300,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the icon path',
                  constraints: const BoxConstraints.tightFor(
                    width: 300,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the icon path',
                  constraints: const BoxConstraints.tightFor(
                    width: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
