import 'package:flutter/material.dart';
import 'package:onboarding/ui/screens/onboarding_screen.dart';

void main() {
  runApp(OnBoardingApp());
}

class OnBoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreen(),
    );
  }
}
