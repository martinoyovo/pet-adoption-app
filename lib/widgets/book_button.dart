import 'package:adoptme/utils/styles.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Styles.highlightColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
      child: const Text('Book a Veterinarian',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}
