import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Condition {
  static final registerSucces = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            titleFontSize: 16,
            messageFontSize: 12,
            title: 'Register Succesfull',
            message: 'Please login to enter into the application',
            contentType: ContentType.success),
      ));
  static final registerPasswordWeak = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            titleFontSize: 16,
            messageFontSize: 12,
            title: 'Warning!',
            message:
                'The password you entered is too weak, please enter another password',
            contentType: ContentType.warning),
      ));
  static final registerExist = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            titleFontSize: 16,
            messageFontSize: 12,
            title: 'Oh hey!',
            message:
                'The email you entered is already registered, please use another email account',
            contentType: ContentType.warning),
      ));
  static final registerFilure = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            titleFontSize: 16,
            messageFontSize: 12,
            title: 'Failure',
            message: 'Something wrong',
            contentType: ContentType.failure),
      ));
}
