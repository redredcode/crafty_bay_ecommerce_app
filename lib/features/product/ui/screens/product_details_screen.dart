import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecommerce_app/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_app/features/product/ui/widgets/size_picker_widget.dart';
import 'package:ecommerce_app/features/reviews/ui/screens/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_details_controller.dart';
import '../widgets/cart_product_qty_inc_dec_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarouselSlider(imageList: [
                        //controller.productDetails.photos[i],
                      ],),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product title
                                      Text(
                                        controller.productModel.title ?? '',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),

                                      // rating, review, add to fav button
                                      Row(
                                        children: [
                                          // star and ratings
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
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, ReviewsScreen.name);
                                            },
                                            child: const Text(
                                              'Reviews',
                                              style: TextStyle(
                                                color: AppColors.themeColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),

                                          // fav icon
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: AppColors.themeColor,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                CartProductQuantityIncDecButton(
                                  onChange: (int value) {},
                                ),
                              ],
                            ),
                            Text(
                              'Color',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const ColorPickerWidget(
                              colors: [
                                Colors.black,
                                AppColors.themeColor,
                                Colors.brown,
                                Colors.grey,
                                Colors.black54,
                              ],
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Size',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizePickerWidget(
                              sizes: [
                                'M',
                                'L',
                                'XL',
                                '2XL',
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Description',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              controller.productModel.description ?? '',
                              style: const TextStyle(fontSize: 12, color: Colors.black45,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildPriceContainer(controller.productModel.currentPrice  ?? 0),
            ],
          );
        }
      ),
    );
  }

  Container buildPriceContainer(int price) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 90,
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 16),
              ),
              Text(
                  price.toString(),
                style: const TextStyle(
                  color: AppColors.themeColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColor,
              ),
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
