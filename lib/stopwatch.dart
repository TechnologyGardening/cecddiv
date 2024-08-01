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
  final laps = <int>[];
  late Timer timer;
  bool _isTicking = false;
  final double itemHeight = 60;
  final scrollController = ScrollController();
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
          children: [
            Expanded(child: _buildCounter(context)),
            Expanded(child: buildDisplay2()),
          ],
        ));
  }

  Column _buildCounter(BuildContext context) {
    return Column(
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
        _buildControl()
      ],
    );
  }

  Row _buildControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isTicking ? null : _starttimer,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)),
          child: const Text("Start"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: _isTicking ? _stoptimer : null,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent)),
          child: const Text("Stop"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: _lap,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.purpleAccent)),
          child: const Text("Lap"),
        )
      ],
    );
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
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

  String _secondsToText2(int m2) {
    final seconds = m2 / 1000;
    return '$seconds seconds';
  }

  void _ontick(Timer timer) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  Widget buildDisplay() {
    return ListView(
      children: [
        for (int m1 in laps)
          ListTile(
            title: Text(_secondsToText2(m1)),
          )
      ],
    );
  }

  Widget buildDisplay2() {
    return ListView.builder(
        itemCount: laps.length,
        controller: scrollController,
        itemExtent: itemHeight,
        itemBuilder: ((context, index) {
          final milis = laps[index];
          return SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    _secondsToText2(milis),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
