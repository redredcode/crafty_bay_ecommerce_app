import 'package:ecommerce_app/features/common/data/models/category%20models/category_list_model.dart';
import 'package:ecommerce_app/features/common/data/models/category%20models/category_pagination_model.dart';
import 'package:ecommerce_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryItemModel,
  });

  final CategoryItemModel categoryItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: {'categoryName' : categoryItemModel.title ?? '', 'categoryId' : categoryItemModel.sId!}, );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Image.network(
              categoryItemModel.icon ?? '',
              height: 40,
              width: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoryItemModel.title ?? '',
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
