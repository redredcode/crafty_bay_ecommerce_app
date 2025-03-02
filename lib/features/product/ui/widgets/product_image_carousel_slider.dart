import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  final List<String>? imageList;

  const ProductImageCarouselSlider({
    super.key, this.imageList,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCarouselSlider(),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          bottom: 12,
            left: 0,
            right: 0,
            child: buildCircularSlidingIndicator(),),
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          viewportFraction: 1,
          onPageChanged: (currentIndex, reason) {
            _selectedIndex.value = currentIndex;
          }),
      items: widget.imageList?.map(
            (imageURL) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  //borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
              );
            },
          );
        },
      ).toList(),
    );
  }

  ValueListenableBuilder<int> buildCircularSlidingIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: value == i
                        ? AppColors.themeColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
            ],
          );
        },
      );
  }
}
