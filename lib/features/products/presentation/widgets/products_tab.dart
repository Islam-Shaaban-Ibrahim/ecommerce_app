import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/search_screen.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/core/widgets/cart_widget.dart';
import 'package:ecommerce_app/core/widgets/search_text_field.dart';
import 'package:ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/cubit/products_states.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});
  static List<String> productsIds = [];

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final productsCubit = serviceLocator.get<ProductsCubit>();
  final wishlistCubit = serviceLocator.get<WishlistCubit>();

  @override
  void initState() {
    super.initState();
    if (productsCubit.products.isEmpty) {
      productsCubit.getProducts();
      wishlistCubit.getWishlist().then((value) {
        ProductsTab.productsIds = wishlistCubit.productIDs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(SearchScreen.routeName)
                        .then(
                          (value) => setState(() {}),
                        );
                  },
                  child: const SearchTextField(),
                ),
              ),
              SizedBox(width: 26.w),
              const CartWidget(),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
                bloc: productsCubit,
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const LoadingIndicator();
                  } else if (state is ProductsError) {
                    return ErrorIndicator(
                        message: state.message,
                        onPressed: () {
                          productsCubit.getProducts();
                          wishlistCubit.getWishlist().then((value) {
                            ProductsTab.productsIds = wishlistCubit.productIDs;
                          });
                        });
                  } else if (state is ProductsSuccess) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        mainAxisExtent: 237.h,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            arguments: productsCubit.products[index],
                            ProductDetailsScreen.routeName,
                          );
                        },
                        child: ProductItem(
                          isAdded: ProductsTab.productsIds
                              .contains(productsCubit.products[index].id),
                          product: productsCubit.products[index],
                        ),
                      ),
                      itemCount: productsCubit.products.length,
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
          )
        ],
      ),
    );
  }
}
