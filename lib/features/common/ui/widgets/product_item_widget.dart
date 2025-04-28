import 'package:ecommerce_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../product/data/models/product_list_pagination_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 170,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.14),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  AssetsPath.sneakerDemo, /// todo: use the image from api... find a way to use list of photos here...
                  width: 170,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$${productModel.currentPrice ?? ''}',
                          style: const TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text('4.8'),
                          ],
                        ),
                        const Spacer(),

                        // fav heart
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
