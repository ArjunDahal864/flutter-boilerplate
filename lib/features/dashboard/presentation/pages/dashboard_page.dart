import 'package:boiler/generated/l10n.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Expanded(
            child: Center(
              child: Text(S.of(context).dashboard),
            ),
          ),
        ],
      ),
    );
  }
}
