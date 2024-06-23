// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/core/widgets/Search_text_field.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBarWithCart extends StatelessWidget {
  const SearchBarWithCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchTextField(),
        ),
        SizedBox(width: 26.w),
        GestureDetector(
          onTap: () async {
            final sharedPref = await SharedPreferences.getInstance();
            if (sharedPref.get(CacheConstants.tokenKey) == null) {
              UIUtils.showLogInMessage(context);
            } else {
              Navigator.of(context).pushNamed(
                CartScreen.routeName,
              );
            }
          },
          child: ImageIcon(
            color: Theme.of(context).primaryColor,
            const AssetImage('assets/images/cartIcon.png'),
            size: 28.sp,
          ),
        )
      ],
    );
  }
}
