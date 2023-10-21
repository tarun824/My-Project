import 'package:flutter/material.dart';

class IsLoadingScreen extends StatelessWidget {
  const IsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
