import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/utils/router.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InkWell(
                child: const SizedBox(height: 60,child:Text("Theme"),width: 80,),
                onTap: () {
                  context.router.push(const ThemeRoute());
                },
              ),
              InkWell(
                child:  const SizedBox(height: 60,child: Text("Lang"),width: 80,),
                onTap: (){
                  context.router.push(const LocaleRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
