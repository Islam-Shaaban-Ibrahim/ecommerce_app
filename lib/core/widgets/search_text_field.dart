// ignore_for_file: file_names

import 'package:ecommerce_app/core/search_screen.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () => Navigator.of(context).pushNamed(SearchScreen.routeName),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.h),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Icon(
            Icons.search,
            size: 35.sp,
            color: ColorsManager.primaryColor.withOpacity(0.75),
          ),
        ),
        hintStyle: TextStyle(
          color: ColorsManager.greyColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        hintText: 'What do you search for ?',
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(30.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(
            30.r,
          ),
        ),
      ),
    );
  }
}
