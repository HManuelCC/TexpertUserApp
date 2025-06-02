import 'package:flutter/material.dart';

class SupportAppBar extends StatefulWidget {
  const SupportAppBar({super.key});

  @override
  State<SupportAppBar> createState() => _SupportAppBarState();
}

class _SupportAppBarState extends State<SupportAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'SupportApp',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
  }
}
