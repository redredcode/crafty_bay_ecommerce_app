import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/ui/widgets/app_bar_icon_button.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../../../common/ui/widgets/home_carousel_slider.dart';
import '../../../common/ui/widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';
import '../../../common/ui/widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _searchBarTextEditingController =
    TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
        actions: [
          AppBarIconButton(
            icon: Icons.person_outline,
            onTap: () {},
          ),
          const SizedBox(
            width: 8,
          ),
          AppBarIconButton(
            icon: Icons.call_outlined,
            onTap: () {},
          ),
          const SizedBox(
            width: 8,
          ),
          AppBarIconButton(
            icon: Icons.notifications_on_outlined,
            onTap: () {},
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ProductSearchBar(
                controller: _searchBarTextEditingController,
              ),
              const SizedBox(height: 8),
              const HomeCarouselSlider(),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                onTap: () {},
                title: 'All Categories',
              ),
              //const SizedBox(height: 4,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._getCategoryList(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              HomeSectionHeader(
                onTap: () {},
                title: 'Popular',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._getProductList()
                  ],
                ),
              ),
              HomeSectionHeader(
                onTap: () {},
                title: 'Special',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._getProductList()
                  ],
                ),
              ),HomeSectionHeader(
                onTap: () {},
                title: 'New',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._getProductList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductItemWidget(),
        ),);
    }
    return productList;
  }

}

