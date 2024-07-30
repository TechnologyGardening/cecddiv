import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  int milliseconds = 0;
  late Timer timer;
  bool _isTicking = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stop Watch"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                _secondsToText(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isTicking ? null : _starttimer,
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber)),
                  child: const Text("Start"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _isTicking ? _stoptimer : null,
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent)),
                  child: const Text("Stop"),
                )
              ],
            )
          ],
        ));
  }

//  onPressed: _isTicking ? null : _starttimer,   Start Button
  void _starttimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _ontick);
    setState(() {
      milliseconds = 0;
      _isTicking = true;
    });
  }

//  onPressed: _isTicking ? _stoptimer : null,   Stop Button
  void _stoptimer() {
    timer.cancel();
    setState(() {
      _isTicking = false;
    });
  }

  String _secondsToText() {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _ontick(Timer timer) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
