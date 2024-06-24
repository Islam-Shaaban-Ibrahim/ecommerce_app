import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/products_tab.dart';
import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  final WishlistItemData wishlistItemData;
  final WishlistCubit wishlistCubit;
  WishlistItem({
    super.key,
    required this.wishlistItemData,
    required this.wishlistCubit,
  });
  final cartCubit = serviceLocator.get<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 398.w,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: ColorsManager.greyColor,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130.w,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      wishlistItemData.imageCover,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: const BorderDirectional(
                    end: BorderSide(
                      width: 1.5,
                      color: ColorsManager.greyColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 8.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 190.w,
                            child: Text(
                              textWidthBasis: TextWidthBasis.parent,
                              wishlistItemData.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: ColorsManager.darkBlueColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Image.asset('assets/images/wishIconFilled.png'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${wishlistItemData.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: ColorsManager.darkBlueColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
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
                              } else if (state is AddToCartSuccess) {
                                UIUtils.hideLoading(context: context);
                                wishlistCubit.wishlist.removeWhere(
                                  (element) =>
                                      element.id == wishlistItemData.id,
                                );

                                wishlistCubit
                                    .removeFromWishlist(wishlistItemData.id);

                                ProductsTab.productsIds
                                    .remove(wishlistItemData.id);
                              }
                            },
                            child: GestureDetector(
                              onTap: () async {
                                await cartCubit.addToCart(wishlistItemData.id);
                              },
                              child: Container(
                                width: 100.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  color: ColorsManager.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
