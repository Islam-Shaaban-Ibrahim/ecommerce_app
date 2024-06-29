import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/products_tab.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;

  final productsCubit = serviceLocator.get<ProductsCubit>();

  final wishlistCubit = serviceLocator.get<WishlistCubit>();
  final searchController = TextEditingController();
  String text = '';
  @override
  void initState() {
    super.initState();
    if (ProductsTab.productsIds.isEmpty) {
      wishlistCubit.getWishlist().then((value) {
        ProductsTab.productsIds = wishlistCubit.productIDs;
      });
    }
    if (productsCubit.products.isEmpty) {
      productsCubit.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Image.asset(
            'assets/images/routeLogo.png',
            width: 66.w,
            height: 22.h,
            fit: BoxFit.fitHeight,
            filterQuality: FilterQuality.high,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  text = value;
                  searchForProduct();
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      text = '';
                      searchController.clear();
                      setState(() {});
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Icon(
                        Icons.close,
                        size: 30.sp,
                        color: ColorsManager.primaryColor.withOpacity(0.75),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(16.h),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Icon(
                      Icons.search,
                      size: 35.sp,
                      color: ColorsManager.primaryColor.withOpacity(0.75),
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: ColorsManager.greyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: 'What do you search for ?',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorsManager.primaryColor, width: 1.2),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorsManager.primaryColor, width: 1.2),
                    borderRadius: BorderRadius.circular(
                      30.r,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: products == null || text.isEmpty
                    ? Center(
                        child: Text(
                          'Start Searching...',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: ColorsManager.greyColor,
                                  fontSize: 22.sp),
                        ),
                      )
                    : products!.isEmpty
                        ? Center(
                            child: Text(
                              'No Search Results',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: ColorsManager.greyColor,
                                      fontSize: 22.sp),
                            ),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                        .contains(products![index].id),
                                    product: products![index],
                                  ),
                                ),
                            itemCount: products?.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchForProduct() {
    products = productsCubit.products
        .where((product) =>
            product.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    setState(() {});
  }
}
