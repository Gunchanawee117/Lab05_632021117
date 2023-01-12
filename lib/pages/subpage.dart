import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key, required this.bmi, required this.msg});

  final double? bmi;
  final String msg;

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.bmi == null ? 'No Result' : widget.bmi!.toStringAsFixed(2),
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.msg,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
