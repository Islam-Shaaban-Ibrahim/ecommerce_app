import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, required this.message, this.onPressed});
  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorsManager.primaryColor,
                  fontSize: 16.sp,
                ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        onPressed != null
            ? ElevatedButton(
                onPressed: onPressed,
                child: const Text('Try Again'),
              )
            : const SizedBox(),
      ],
    );
  }
}
