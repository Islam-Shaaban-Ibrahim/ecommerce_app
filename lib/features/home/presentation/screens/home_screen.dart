import 'package:ecommerce_app/features/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/nav_bar_icon.dart';
import 'package:ecommerce_app/features/products/presentation/screens/widgets/products_tab.dart';
import 'package:ecommerce_app/features/profile/presentation/screens/widgets/prfile_tab.dart';
import 'package:ecommerce_app/features/wishlist/presentation/screens/widgets/wishlist_tab.dart';
import 'package:flutter/material.dart';

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
    ProfileTab(),
  ];

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
          onTap: (value) {
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
            BottomNavigationBarItem(
              label: 'account',
              icon: NavBarIcon(
                imageName: 'accountIcon',
                isSelected: selectedIndex == 3,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: tabs[selectedIndex]),
    );
  }
}
