import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                    top: 85.h,
                    left: 81.w,
                    right: 80.w,
                    bottom: 46.9.h,
                  ),
                  child: Image.asset('assets/images/route.png'),
                ),
                Text(
                  'Full Name',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  keyBoardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your name";
                    } else if (!Validator.hasMinLength(value, minLength: 3)) {
                      return "name must be at least 3 letters ";
                    }

                    return null;
                  },
                  controller: nameController,
                  hintText: 'enter your full name',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, top: 32.h),
                  child: Text(
                    'Mobile Number',
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
                      return "please enter your mobile number";
                    } else if (!Validator.isValidEgPhone(value)) {
                      return "please enter a valid mobile number ";
                    }

                    return null;
                  },
                  controller: phoneController,
                  hintText: 'enter your mobile number ',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, top: 32.h),
                  child: Text(
                    'E-mail Address',
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
                      return "please enter your e-mail";
                    } else if (!Validator.isValidEmail(value)) {
                      return "please enter a valid e-mail";
                    }

                    return null;
                  },
                  controller: emailController,
                  hintText: 'enter your e-mail',
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
                      return "please enter your password";
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
                  height: 56.h,
                ),
                CustomElevatedButton(onPressed: _register, label: 'Sign up'),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    if (formKey.currentState?.validate() == true) {}
    setState(() {});
  }
}
