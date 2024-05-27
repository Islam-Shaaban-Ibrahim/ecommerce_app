import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/features/home/domain/entities/brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  final Brand brand;

  const BrandItem({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.greyColor),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(brand.image),
                ),
                color: Colors.white,
                shape: BoxShape.circle),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            brand.name,
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
