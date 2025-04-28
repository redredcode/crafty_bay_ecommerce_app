import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        }, icon: const Icon(Icons.arrow_back_ios_new),),
      ),
    );
  }
}
