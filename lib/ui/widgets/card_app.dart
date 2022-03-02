import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        color: Colors.teal,
        elevation: 10,
        child: Padding(padding: const EdgeInsets.all(30), child: child),
      ),
    );
  }
}
