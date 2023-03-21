// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min;
  final int max;

  final randomGenerator = Random();

  RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          generatedNumber.value?.toString() ?? 'Generate a number',
          style: const TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Generate',
            style: TextStyle(fontSize: 30),
          ),
        ),
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
