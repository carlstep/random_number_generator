// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_number_generator/randomizer_change_notifier.dart';

class RandomizerPage extends StatelessWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.generatedNumber.toString() ?? 'Generate a Number',
              style: const TextStyle(fontSize: 42),
            );
          },
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
          context.read<RandomizerChangeNotifier>().generatedRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
