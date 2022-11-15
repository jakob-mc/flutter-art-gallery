import 'package:flutter/material.dart';
import 'package:flutter_art_gallery/counter/bloc/counter_bloc.dart';
import 'package:flutter_art_gallery/counter/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          context.read<CounterBloc>().add(CounterIncrementPressed()),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
