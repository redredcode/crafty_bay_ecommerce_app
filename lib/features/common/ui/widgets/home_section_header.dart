import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key, required this.onTap, required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:  const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'See all',
            style: TextStyle(color: AppColors.themeColor,),
          ),
        ),
      ],
    );
  }
}
