import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cecddiv/abcd/imagenames.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 254, 66),
        title: Text(
          "CE CD Div",
          style:
              GoogleFonts.leckerliOne(textStyle: const TextStyle(fontSize: 30)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.edit),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            )
          ],
        ),
      ),
      body: const Center(child: StackExample()),
    );
  }
}

class ImmutableWidget extends StatelessWidget {
  const ImmutableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        color: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blue,
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.yellow,
          ),
        ));
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 400,
          height: 400,
          child: Image.asset(beachImage,
              opacity: const AlwaysStoppedAnimation(.5)),
        ),
        SizedBox(
          width: 600,
          height: 600,
          child: Image.asset(sunsetImage,
              opacity: const AlwaysStoppedAnimation(.3)),
        ),
        SizedBox(
          width: 800,
          height: 800,
          child: Image.network(url1, opacity: const AlwaysStoppedAnimation(.1)),
        ),
      ],
    );
  }
}
