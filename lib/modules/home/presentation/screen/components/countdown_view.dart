import 'package:flutter/material.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({super.key, required this.countDown});

  final int countDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        const Text("Your session starts in", style: TextStyle(fontSize: 20)),
        Container(),
        Text(
          countDown.toString(),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
