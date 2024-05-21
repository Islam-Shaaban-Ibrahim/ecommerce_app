import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            radius: 50.r,
            backgroundImage: CachedNetworkImageProvider(
              category.image,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            category.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.sp,
                color: ColorsManager.darkBlueColor,
                fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
