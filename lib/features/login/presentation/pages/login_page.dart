import 'package:boiler/features/login/presentation/widgets/local_login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text('Login Page',style: Theme.of(context).textTheme.bodyText1,),
           const LocalLoginButton(),
          ],
        ),
      ),
    );
  }
}
