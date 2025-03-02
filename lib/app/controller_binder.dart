import 'package:ecommerce_app/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce_app/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/home/ui/controllers/slider_list_controller.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../features/auth/ui/controllers/sign_up_controller.dart';
import '../features/common/ui/controllers/category_list_controller.dart';
import '../features/product/ui/controllers/product_details_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(AuthController());
    Get.put(OtpVerificationController());
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(ProductDetailsController());
  }
}