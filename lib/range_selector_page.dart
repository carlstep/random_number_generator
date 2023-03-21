// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:random_number_generator/randomizer_page.dart';
import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
        ),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(
                  min: min.value,
                  max: max.value,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
