// ignore: implementation_imports
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/utils/router.dart';
import 'package:boiler/core/widgets/custom_snackbar.dart';
import 'package:boiler/features/login/presentation/bloc/login_bloc.dart';
import 'package:boiler/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:boiler/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                onTap: () {
                  context.router.push(const ThemeRoute());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  padding: const EdgeInsets.all(18.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                      color: Theme.of(context).primaryColor),
                  width: double.infinity,
                  child: Text(S.of(context).theme,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(18.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                        color: Theme.of(context).primaryColor),
                    height: 80,
                    child: Text(
                      S.of(context).language,
                      style: Theme.of(context).textTheme.headline4,
                    )),
                onTap: () {
                  context.router.push(const LocaleRoute());
                },
              ),

              // logout button
              InkWell(
                child: BlocBuilder<SettingsBloc, SettingsState>(
                    buildWhen: (previous, current) {
                      if (current is OnLogoutCompleteState) {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          CustomSnackBar.showSnackBar(context, "logout success");

                        });
                      }
                      return (current is! OnLogoutCompleteState);
                    },
                    builder: (context, state) {
                      if (state is OnSettingsErrorState) {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          CustomSnackBar.showSnackBar(context, state.errorMessage);
                        });
                      }
                      if (state is OnLogoutCompleteState) {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          CustomSnackBar.showSnackBar(context, "logout success");
                        });
                      }
                    return Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(18.0),
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ],
                            color: Theme.of(context).primaryColor),
                        height: 80,
                        child: Text(
                          S.of(context).logout,
                          style: Theme.of(context).textTheme.headline4,
                        ));
                  }
                ),
                onTap: () {
                 BlocProvider.of<SettingsBloc>(context).add(LogoutEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
