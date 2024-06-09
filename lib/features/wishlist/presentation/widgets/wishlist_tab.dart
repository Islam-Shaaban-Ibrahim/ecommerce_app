import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_sates.dart';
import 'package:ecommerce_app/features/wishlist/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = serviceLocator.get<WishlistCubit>()..getWishlist();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
          Expanded(
            child: BlocBuilder<WishlistCubit, WishlistState>(
              bloc: wishlistCubit,
              builder: (context, state) {
                if (state is GetWishlistLoading) {
                  return const LoadingIndicator();
                } else if (state is GetWishlistError) {
                  return ErrorIndicator(message: state.message);
                } else {
                  return wishlistCubit.wishlist.isEmpty
                      ? Center(
                          child: Text(
                            'No Products',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: ColorsManager.greyColor,
                                    fontSize: 22.sp),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (_, index) => WishlistItem(
                            wishlistItemData: wishlistCubit.wishlist[index],
                          ),
                          itemCount: wishlistCubit.wishlist.length,
                        );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
