import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  final int alldone;
  final int alltodos;

  const Counters({super.key, required this.alldone, required this.alltodos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text(
        "$alldone/$alltodos",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: alldone == alltodos ? Colors.greenAccent : Colors.white,
        ),
      ),
    );
  }
}
