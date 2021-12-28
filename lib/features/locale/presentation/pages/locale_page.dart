import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:boiler/features/locale/presentation/bloc/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalePage extends StatelessWidget {
  const LocalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Locale: ${Localizations.localeOf(context).toString()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: kSupportedLocales.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        BlocProvider.of<LocaleBloc>(context).add(
                          LocaleChangeEvent(
                            locale: Locale(
                              countryCode: kSupportedLocales[index].countryCode,
                              languageCode: kSupportedLocales[index].languageCode,
                              // add user ID Here if needed
                              userID: "",
                            ),
                          ),
                        );
                      },
                      title: Text(kSupportedLocales[index].countryCode,),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
