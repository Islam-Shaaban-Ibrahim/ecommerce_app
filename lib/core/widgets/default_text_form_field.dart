import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.isPassword = false,
      this.isObscure = false,
      required this.keyBoardType,
      this.suffix,
      this.maxLength});
  final String hintText;
  final int? maxLength;
  bool isObscure;
  bool isPassword;
  Widget? suffix;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      obscureText: widget.isObscure,
      keyboardType: widget.keyBoardType,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: ColorsManager.redColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.greyColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.greyColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.whiteColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.redColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  widget.isObscure = !widget.isObscure;
                  setState(() {});
                },
                icon: widget.isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 18.sp, color: ColorsManager.greyColor),
        filled: true,
        fillColor: ColorsManager.whiteColor,
      ),
    );
  }
}
