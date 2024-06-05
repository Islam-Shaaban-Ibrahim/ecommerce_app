import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});
  final Product product;
  final cartCubit = serviceLocator.get<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.greyColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        Icon(size: 50.sp, Icons.error_outline_outlined),
                    width: double.infinity,
                    height: 128.h,
                    fit: BoxFit.cover,
                    imageUrl: product.imageCover,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/wishlistSign.png',
                      filterQuality: FilterQuality.high,
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 10.h,
              bottom: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorsManager.darkBlueColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  'EGP ${product.price}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorsManager.darkBlueColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  children: [
                    Text(
                      'Review (${product.ratingsAverage})',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsManager.darkBlueColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Image.asset(
                      'assets/images/ratingIcon.png',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                    BlocListener<CartCubit, CartState>(
                      bloc: cartCubit,
                      listener: (context, state) {
                        if (state is AddToCartLoading) {
                          UIUtils.showLoading(
                              isDismissible: false,
                              context: context,
                              actionName: "Loading...");
                        } else if (state is AddToCartError) {
                          UIUtils.hideLoading(context: context);
                          UIUtils.showMessage(
                              isDismissible: false,
                              context: context,
                              message: state.message,
                              negAction: 'Cancel');
                        } else {
                          UIUtils.hideLoading(context: context);
                        }
                      },
                      child: GestureDetector(
                        onTap: () {
                          cartCubit.addToCart(product.id);
                        },
                        child: Icon(
                          size: 30.sp,
                          Icons.add_circle,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
