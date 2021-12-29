import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:boiler/generated/l10n.dart';
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
            Expanded(
              child: InkWell(
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ThemeChangeEvent(theme: kLightTheme));
                },
                child: Container(
                  height: 400,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.9),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Text(S.of(context).lightTheme,),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ThemeChangeEvent(theme: kDarkTheme));
                },
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(18.0),
                  alignment: Alignment.center,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Text(S.of(context).darkTheme,style: const TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
