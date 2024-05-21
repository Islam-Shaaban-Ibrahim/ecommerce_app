import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.h),
        prefixIcon: IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Icon(
                Icons.search,
                size: 35.sp,
                color: ColorsManager.primaryColor.withOpacity(0.75),
              ),
            )),
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
