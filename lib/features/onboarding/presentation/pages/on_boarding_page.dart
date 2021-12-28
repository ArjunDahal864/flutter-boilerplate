import 'package:boiler/features/onboarding/presentation/widgets/on_boarding_complete_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: OnBoardingCompleteButton(),
          ),
          Text("OnBoardingPage"),
        ],
      ),
    );
  }
}
