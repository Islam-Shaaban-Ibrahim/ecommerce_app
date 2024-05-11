import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 91.h,
                    left: 81.w,
                    right: 80.w,
                    bottom: 86.9.h,
                  ),
                  child: Image.asset('assets/images/route.png'),
                ),
                Text(
                  'Welcome Back To Route',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24.sp),
                ),
                Text(
                  'Please sign in with your e-mail',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 16.sp),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, top: 40.h),
                  child: Text(
                    'E-mail',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18.sp),
                  ),
                ),
                CustomTextFormField(
                  keyBoardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "invalid input";
                    } else if (!Validator.isValidEmail(value)) {
                      return "please enter a valid e-mail ";
                    }

                    return null;
                  },
                  controller: emailController,
                  hintText: 'enter your password',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, top: 32.h),
                  child: Text(
                    'Password',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18.sp),
                  ),
                ),
                CustomTextFormField(
                  isObscure: true,
                  isPassword: true,
                  keyBoardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid Input";
                    } else if (!Validator.isValidPassword(value)) {
                      return "password must be >=6 and <=20 characters ";
                    } else if (value.trim().contains(' ')) {
                      return "password can't have spaces";
                    }

                    return null;
                  },
                  controller: passwordController,
                  hintText: 'enter your password',
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot password",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                CustomElevatedButton(onPressed: _logIn, label: 'Login'),
                TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Don't have an account? Create Account",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    if (formKey.currentState?.validate() == true) {}
    setState(() {});
  }
}
