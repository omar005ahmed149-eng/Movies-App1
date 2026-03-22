import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showLoading(BuildContext context, {bool isDismiss = true}) {
    showDialog(
      barrierDismissible: isDismiss,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Center(child: CircularProgressIndicator())],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required String message,
    required Color bgColor,
    required Color fgColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: fgColor,
      fontSize: 16.0,
    );
  }
}
