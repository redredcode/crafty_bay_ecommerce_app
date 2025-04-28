import 'package:ecommerce_app/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce_app/features/product/ui/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.categoryID,
  });

  static const String name = '/product/product-list-by-category';
  final String categoryName;
  final int categoryID;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListController>()
        .getProductListByCategory(widget.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductListController>(
          builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 1,
              childAspectRatio: 0.8,
            ),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return FittedBox(
                child: ProductItemWidget(productModel: controller.productList[index]),
              );
            },
          ),
        );
      }),
    );
  }
}
