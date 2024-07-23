import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stop Watch"),
        ),
        body: Center(
          child: Text(
            '0 Seconds',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ));
  }
}
