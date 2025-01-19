import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({
    super.key,
    required this.sizes, //required this.child,
  });

  final List<String> sizes;

  //final Widget child;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...widget.sizes.map(
            (size) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = size;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: _selectedSize == size
                            ? AppColors.themeColor
                            : Colors.transparent,
                        child: Text(
                          size,
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  _selectedSize == size ? Colors.white : null),
                        ),
                      ),
                    ),
                    // if (_selectedSize == size)
                    //   Icon( _isSelected ? Icons.check  : null, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
