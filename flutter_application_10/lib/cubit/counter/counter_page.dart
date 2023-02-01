import 'package:flutter/material.dart';
import 'package:flutter_application_10/cubit/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Счетчик',
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (state.number <= 0) {
                      Text('${state.number}');
                    } else {
                      BlocProvider.of<CounterCubit>(context).minus();
                    }
                  },
                  child: const Text('-1'),
                ),
                Text(
                  '${state.number}',
                  style: const TextStyle(fontSize: 70, wordSpacing: 2),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).plus();
                  },
                  child: const Text('+2'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
