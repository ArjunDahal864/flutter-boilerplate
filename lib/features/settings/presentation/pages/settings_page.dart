import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/utils/router.dart';
import 'package:boiler/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  context.router.push(const ThemeRoute());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: double.infinity,
                  child: Text(S.of(context).theme),
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                    height:60,child: Text(S.of(context).language)),
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
