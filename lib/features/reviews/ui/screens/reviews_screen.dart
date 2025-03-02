import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  static const String name = '/product-reviews-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(itemBuilder: (context, index){
              return Container(
                child: Text(''),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child:  const Icon(Icons.add, color: AppColors.themeColor,),),
    );
  }
}
