import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton(
      {super.key, required this.onPressed, required this.label});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorsManager.whiteColor),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 398.w,
        height: 64.h,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: ColorsManager.darkBlueColor),
          ),
        ),
      ),
    );
  }
}
