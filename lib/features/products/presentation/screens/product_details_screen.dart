import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'productDetails';

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productQuantity = 1;

  final readMoreTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  final cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
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
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: ImageIcon(
              const AssetImage(
                'assets/images/cartIcon.png',
              ),
              size: 30.sp,
            ),
          )
        ],
        title: Text(
          'Product Details',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorsManager.darkBlueColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: ColorsManager.greyColor,
                      width: 1.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CarouselSlider.builder(
                      itemCount: product.images.length,
                      itemBuilder: (context, index, realIndex) =>
                          CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Icon(size: 50.sp, Icons.error_outline_outlined),
                        placeholder: (context, url) => const LoadingIndicator(),
                        imageUrl: product.images[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 6),
                        autoPlayAnimationDuration: const Duration(seconds: 3),
                        autoPlay: true,
                        viewportFraction: 1,
                        height: 300.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsManager.darkBlueColor,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Text(
                    'EGP ${product.price}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsManager.darkBlueColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 12.w,
                    ),
                    width: 102.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ColorsManager.greyColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${product.sold}  Sold',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ColorsManager.darkBlueColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Image.asset(
                    'assets/images/ratingIcon.png',
                  ),
                  Text(
                    ' ${product.ratingsAverage} (${product.ratingsQuantity})',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsManager.darkBlueColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const Spacer(),
                  Container(
                    width: 122.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (productQuantity > 1) {
                                productQuantity--;
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: ColorsManager.whiteColor,
                              size: 25.sp,
                            ),
                          ),
                          Text(
                            '$productQuantity',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: ColorsManager.whiteColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ++productQuantity;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: ColorsManager.whiteColor,
                              size: 25.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsManager.darkBlueColor,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 10.h),
              ReadMoreText(
                product.description,
                style: readMoreTextStyle,
                trimLines: 2,
                trimMode: TrimMode.Line,
                moreStyle: readMoreTextStyle.copyWith(
                  color: ColorsManager.darkBlueColor,
                ),
                lessStyle: readMoreTextStyle.copyWith(
                  color: ColorsManager.darkBlueColor,
                ),
                trimCollapsedText: ' Read More',
                trimExpandedText: ' Read Less',
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: readMoreTextStyle.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        ' EGP ${product.price * productQuantity}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ColorsManager.darkBlueColor,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                  BlocListener<CartCubit, CartState>(
                    bloc: cartCubit,
                    listener: (context, state) {
                      if (state is AddAndUpdateCartLoading) {
                        UIUtils.showLoading(
                            isDismissible: false,
                            context: context,
                            actionName: "Loading...");
                      } else if (state is AddAndUpdateCartError) {
                        UIUtils.hideLoading(context: context);
                        UIUtils.showMessage(
                            isDismissible: false,
                            context: context,
                            message: state.message,
                            negAction: 'Cancel');
                      } else if (state is AddAndUpdateCartSuccess) {
                        UIUtils.hideLoading(context: context);
                      }
                    },
                    child: GestureDetector(
                      onTap: () async {
                        cartCubit.addAndUpdateCart(product.id, productQuantity);
                      },
                      child: Container(
                        width: 265.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorsManager.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/images/cartIcon2.png',
                              ),
                              size: 24.sp,
                              color: ColorsManager.whiteColor,
                            ),
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
