import 'package:flutter/material.dart';

class CustomSnackBar{
  static void showSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.black),),
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      elevation: 10.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).primaryColor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}