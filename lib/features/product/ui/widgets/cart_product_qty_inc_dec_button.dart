import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class CartProductQuantityIncDecButton extends StatefulWidget {
  const CartProductQuantityIncDecButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<CartProductQuantityIncDecButton> createState() => _CartProductQuantityIncDecButtonState();
}

class _CartProductQuantityIncDecButtonState extends State<CartProductQuantityIncDecButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconButton(icon: Icons.remove, onTap: () {
          setState(() {
            while (_count > 1) {
              _count--;
              widget.onChange(_count);
            }
          });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('$_count', style: const TextStyle(
              fontSize: 18
          ),),
        ),
        buildIconButton(icon: Icons.add, onTap: () {
          if (_count < 20) {
                setState(() {
                  _count++;
                  widget.onChange(_count);
                });
              }
            }),
      ],
    );
  }

  GestureDetector buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          //padding: const EdgeInsets.all(4),
          //margin: EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4),
          ),
          //padding: const EdgeInsets.all(4),
          //margin: EdgeInsets.all(2),
          child: Icon(icon, color: Colors.white,),
        ),
      );
  }
}
