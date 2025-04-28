import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../product/ui/widgets/cart_product_qty_inc_dec_button.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.sneakerDemo,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Nike Shoe - AK45394 New year deal',
                              maxLines: 1,
                              style: textTheme.bodyLarge
                                  ?.copyWith(overflow: TextOverflow.ellipsis),
                            ),
                            const Row(
                              children: [
                                Text('Color: Red'),
                                SizedBox(width: 8),
                                Text('Size: XL'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                            color: AppColors.themeColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      CartProductQuantityIncDecButton(
                        onChange: (int noOfItem) {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}