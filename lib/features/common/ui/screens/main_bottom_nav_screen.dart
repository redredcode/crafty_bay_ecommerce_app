import 'package:ecommerce_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors.dart';
import '../../../category/ui/screens/category_list_screen.dart';
import '../../../home/ui/controllers/slider_list_controller.dart';
import '../controllers/category_list_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliders();
    Get.find<CategoryListController>().getCategoryList();
  }


  final List<IconData> filledIcons = [
    Icons.home,
    Icons.category,
    Icons.shopping_cart,
    Icons.favorite,
  ];

  final List<IconData> outlinedIcons = [
    Icons.home_outlined,
    Icons.category_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
  ];

  final List<String> labels = [
    'Home',
    'Categories',
    'Cart',
    'Favorites',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.themeColor.withOpacity(0.2), // Color for the indicator
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: AppColors.themeColor, fontWeight: FontWeight.w500); // Color for the selected label
              }
              return const TextStyle(); // Default color for other labels
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: AppColors.themeColor); // Color for the selected icon
              }
              return const IconThemeData(); // Default color for other icons
            }),
          ),
          child: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: List.generate(filledIcons.length, (index) {
              return NavigationDestination(
                icon: Icon(
                  bottomNavController.selectedIndex == index
                      ? filledIcons[index]
                      : outlinedIcons[index],
                ),
                label: labels[index],
              );
            }),
          ),
        ),
      );
    });
  }
}
