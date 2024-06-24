import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  final cartCubit = serviceLocator.get<CartCubit>()..getCart();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30.sp,
            ),
          ),
        ],
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorsManager.darkBlueColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is UpdateCartLoading || state is RemoveFromCartLoading) {
              UIUtils.showLoading(
                isDismissible: false,
                context: context,
                actionName: 'Loading...',
              );
            } else if (state is UpdateCartError) {
              UIUtils.hideLoading(context: context);
              UIUtils.showMessage(
                  isDismissible: false,
                  context: context,
                  message: state.message,
                  negAction: 'Cancel');
            } else if (state is RemoveFromCartError) {
              UIUtils.hideLoading(context: context);
              UIUtils.showMessage(
                  isDismissible: false,
                  context: context,
                  message: state.message,
                  negAction: 'Cancel');
            } else if (state is UpdateCartSuccess ||
                state is RemoveFromCartSuccess) {
              UIUtils.hideLoading(context: context);
            }
          },
          bloc: cartCubit,
          builder: (context, state) {
            if (state is GetCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetCartError) {
              return ErrorIndicator(
                message: state.message,
                onPressed: state.message == 'Failed To Get Cart'
                    ? () {
                        cartCubit.getCart();
                      }
                    : null,
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: cartCubit.isCartEmpty
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
                            itemCount: cartCubit.cart.products.length,
                            itemBuilder: (context, index) => CartItem(
                              cartItem: cartCubit.cart.products[index],
                              cartCubit: cartCubit,
                            ),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total price',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: ColorsManager.greyColor,
                                  fontSize: 20.sp,
                                ),
                          ),
                          Text(
                            ' EGP ${cartCubit.cart.totalCartPrice}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: ColorsManager.darkBlueColor,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
