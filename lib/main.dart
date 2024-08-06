import 'package:cecddiv/basicscreen.dart';
import 'package:cecddiv/loginscreen.dart';
import 'package:cecddiv/profilescreen.dart';
import 'package:cecddiv/stopwatch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Center(child: MyLoginScreen()
                //child: StopWatch(),
                //child: ProfileScreen(),
                )),
      ),
    );
  }
}
