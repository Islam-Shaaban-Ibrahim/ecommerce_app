import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIUtils {
  static void showLoading({
    required BuildContext context,
    required String actionName,
    bool isDismissible = true,
  }) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return PopScope(
            canPop: isDismissible,
            child: AlertDialog(
              content: SizedBox(
                height: 100.h,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        actionName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showMessage(
      {required BuildContext context,
      bool isDismissible = true,
      String title = 'Error',
      String? posAction,
      String? negAction,
      Function? posActionFunction,
      Function? negAtionFunction,
      Color? backgroundColor,
      Color? foregroundColor,
      required String message}) {
    List<Widget> actions = [];
    if (posAction != null) {
      actions.add(TextButton(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll<TextStyle?>(
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
            foregroundColor: MaterialStatePropertyAll<Color>(
                foregroundColor ?? Colors.black),
            backgroundColor: MaterialStatePropertyAll<Color>(
                backgroundColor ?? Colors.transparent),
          ),
          onPressed: () {
            Navigator.pop(context);
            if (posActionFunction != null) {
              posActionFunction.call();
            }
          },
          child: Text(posAction)));
    }
    if (negAction != null) {
      actions.add(TextButton(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll<TextStyle?>(
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20.sp,
                    )),
            foregroundColor: MaterialStatePropertyAll<Color>(
                foregroundColor ?? Colors.black),
            backgroundColor: MaterialStatePropertyAll<Color>(
                backgroundColor ?? Colors.transparent),
          ),
          onPressed: () {
            Navigator.pop(context);
            if (negAtionFunction != null) {
              negAtionFunction.call();
            }
          },
          child: Text(negAction)));
    }
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return PopScope(
            canPop: isDismissible,
            child: AlertDialog(
                actions: actions,
                title: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black)),
                content: Text(message,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16.sp))),
          );
        });
  }

  static void showLogInMessage(BuildContext context) {
    UIUtils.showMessage(
        foregroundColor: ColorsManager.whiteColor,
        backgroundColor: ColorsManager.primaryColor,
        context: context,
        message:
            "To manage your cart or wishlist, please log in or sign up. Logging in helps us save your selections and offer a more personalized shopping experience.",
        title: " Log In Required !",
        isDismissible: false,
        negAction: 'Cancel',
        posAction: 'Log In',
        posActionFunction: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
        });
  }
}
