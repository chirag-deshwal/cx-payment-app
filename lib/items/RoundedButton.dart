// ignore: file_names
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const RoundedButton(
      {super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(120),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120.0),
            color: const Color.fromARGB(255, 223, 223, 223),
          ),
          padding: const EdgeInsets.all(15),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 20, 20, 20),
            size: 28,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 20, 20, 20),
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
