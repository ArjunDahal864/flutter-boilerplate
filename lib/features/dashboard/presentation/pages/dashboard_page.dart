import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Dashboard'),
            ),
          ),
          MaterialButton(
            child: const Text('Go to settings'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
