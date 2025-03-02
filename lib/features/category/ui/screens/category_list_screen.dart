import 'package:ecommerce_app/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../../../common/ui/widgets/centered_circular_progress_indicator.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryListController _categoryListController =
      Get.find<CategoryListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _categoryListController.getCategoryList();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          onPressed: _onPop,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => _onPop(),
        child: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().refreshCategoryList();
          },
          child: GetBuilder<CategoryListController>(builder: (controller) {
            if (controller.initialInProgress) {
              return const CenteredCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryItemWidget(
                          categoryItemModel: controller.categoryList[index],
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: const LinearProgressIndicator(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
