import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/announcement_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/brands_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Image.asset(
                'assets/images/routeLogo.png',
                width: 66.w,
                height: 22.h,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SearchBarWithCart(),
            SizedBox(height: 16.h),
            const AnnouncementSection(),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      color: ColorsManager.darkBlueColor,
                      fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: ColorsManager.darkBlueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const CategorySection(),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brands',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      color: ColorsManager.darkBlueColor,
                      fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: ColorsManager.darkBlueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const BrandSection(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
