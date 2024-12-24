import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list-screen';

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
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(
              child: CategoryItemWidget(),
            );
          },
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
