import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/widgets/custom_snackbar.dart';
import 'package:boiler/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class LocalLoginButton extends StatelessWidget {
  const LocalLoginButton({Key? key}) : super(key: key);

  @override
  BlocBuilder build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        if (current is LoginSuccessState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            context.router.replaceNamed(kHomePage);
          });
        }
        return (current is! LoginSuccessState);
      },
      builder: (context, state) {
        if (state is LoginFailureState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            CustomSnackBar.showSnackBar(context, state.error);
          });
        }
        if (state is LocalLoginSuccessState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            context.router.replaceNamed(kHomePage);
          });
        }
        if (state is LoginLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(LocalLoginButtonPressedEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.person),
                      SizedBox(width: 16),
                      Text('Local Login using either face unlock or fingerprint'),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
