import 'package:ecommerce_app/features/common/data/models/category%20models/category_list_model.dart';
import 'package:ecommerce_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.monitor,
              color: AppColors.themeColor, // use image from new api later on
              size: 40,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoryModel.code.toString() ?? '', /// it should be .name or something else. just trying to follow along the classes with old api
            style: const TextStyle(
              color: AppColors.themeColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
