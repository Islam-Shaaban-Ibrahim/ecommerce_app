import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/brands/brands_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/nav_bar_icon.dart';
import 'package:ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/products_tab.dart';
import 'package:ecommerce_app/features/wishlist/presentation/widgets/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = const [
    HomeTab(),
    ProductsTab(),
    WishlistTab(),
  ];
  @override
  void initState() {
    super.initState();
    serviceLocator.get<CategoriesCubit>().getCategories();
    serviceLocator.get<BrandsCubit>().getBrands();

    serviceLocator.get<ProductsCubit>().products = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) async {
            final sharedPref = await SharedPreferences.getInstance();
            if (sharedPref.get(CacheConstants.tokenKey) == null && value == 2) {
              // ignore: use_build_context_synchronously
              UIUtils.showLogInMessage(context);
              return;
            }
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: NavBarIcon(
                imageName: 'homeIcon',
                isSelected: selectedIndex == 0,
              ),
            ),
            BottomNavigationBarItem(
              label: 'category',
              icon: NavBarIcon(
                imageName: 'categoryIcon',
                isSelected: selectedIndex == 1,
              ),
            ),
            BottomNavigationBarItem(
              label: 'wishlist',
              icon: NavBarIcon(
                imageName: 'wishlistIcon',
                isSelected: selectedIndex == 2,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: tabs[selectedIndex]),
    );
  }
}
