import 'package:ecommerce_app/core/widgets/Search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          onTap: () {},
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