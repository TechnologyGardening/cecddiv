import 'package:flutter/material.dart';

class DispColumn extends StatelessWidget {
  const DispColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hello"),
          Text("World"),
          Text("From"),
          Text("BTech CE/IT"),
          Text("Hello"),
          Text("World"),
          Text("From"),
          Text("BTech CE/IT")
        ],
      ),
    );
  }
}
