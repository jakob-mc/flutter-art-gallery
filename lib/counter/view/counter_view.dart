import 'package:flutter/material.dart';

import 'counter_text.dart';
import 'increment_button.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
      ),
      body: const CounterText(),
      floatingActionButton: const IncrementButton(),
    );
  }
}
