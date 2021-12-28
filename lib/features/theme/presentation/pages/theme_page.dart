import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:boiler/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  return scaffold;
    return Scaffold(
      body: Center(
        // add two containers on row
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                BlocProvider.of<ThemeBloc>(context)
                    .add(const ThemeChangeEvent(theme: kLightTheme));
              },
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<ThemeBloc>(context)
                    .add(const ThemeChangeEvent(theme: kDarkTheme));
              },
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
