import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_app/features/product/data/models/product_list_pagination_model.dart';
import 'package:ecommerce_app/features/product/ui/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/data/models/category models/category_pagination_model.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../controllers/slider_list_controller.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarTextEditingController =
      TextEditingController();
  final SliderListController _sliderListController =
      Get.find<SliderListController>();
  final ProductListController _productListController = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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

              GetBuilder<SliderListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const Center(
                    child: SizedBox(
                      height: 180,
                      child: CenteredCircularProgressIndicator(),
                    ),
                  );
                }
                return HomeCarouselSlider(
                  sliderList: controller.sliderBannerList,
                );
              }),
              const SizedBox(height: 8),
              HomeSectionHeader(
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
                title: 'All Categories',
              ),
              //const SizedBox(height: 4,),
              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const Center(
                    child: SizedBox(
                      height: 100,
                      child: CenteredCircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ..._getCategoryList(controller.categoryList),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 8),

              // Popular
              HomeSectionHeader(
                onTap: () {},
                title: 'Popular',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [..._getProductList([])],
                  //children: [..._getProductList(_productListController.productList)],
                ),
              ),

              // Special
              HomeSectionHeader(
                onTap: () {},
                title: 'Special',
              ),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [..._getProductList([])],
                      //children: [..._getProductList(_productListController.productList)],
                    ),
                  ),

              // New
              HomeSectionHeader(
                onTap: () {},
                title: 'New',
              ),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [..._getProductList([])],
                      //children: [..._getProductList(_productListController.productList)],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }

  List<Widget> _getCategoryList(List<CategoryItemModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CategoryItemWidget(
            categoryItemModel: categoryModels[i],
          ),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList(List<ProductModel> productList) {
    List<Widget> list = [];
    for (int i = 0; i < productList.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductItemWidget(productModel: productList[i],),
        ),
      );
    }
    return list;
  }
}
