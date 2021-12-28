import 'package:flutter/material.dart';

class DashboardOption extends StatelessWidget {
  final DashboardOptionModel option;
  const DashboardOption({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('DashBoardOption'),
        ],
      ),
    );
  }
}

class DashboardOptionModel {
  final int option;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  // create consturctor
  const DashboardOptionModel({
    required this.option,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
