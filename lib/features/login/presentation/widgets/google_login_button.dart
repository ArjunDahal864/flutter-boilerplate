import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/widgets/custom_snackbar.dart';
import 'package:boiler/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({ Key? key }) : super(key: key);

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
      builder: (context,state){
        if (state is LoginLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
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

        return GestureDetector(
          onTap: () {
            // bloc provider 
            BlocProvider.of<LoginBloc>(context).add(GoogleLoginButtonPressedEvent());
          },
          child: Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 36.0,
                
               ),
                SizedBox(width: 10.0),
                Text('Sign in with Google'),
              
              ],
            ),
          ),
        );
        
      }
    );
  }
}