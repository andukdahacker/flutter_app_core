import 'package:flutter/material.dart';

class SuggestedSearchKeyWidget extends StatelessWidget {
  const SuggestedSearchKeyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Suggested'),
        Chip(label: Text('Javascript'))
      ],
    );
  }
}
