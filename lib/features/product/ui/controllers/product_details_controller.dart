import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:ecommerce_app/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductDetails _productDetails = ProductDetails();

  ProductDetails get productDetails => _productDetails;

  Future<bool> getProductDetails(int productID) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productDetailsUrl(productID),
    );
    if (response.isSuccess) {
      _productDetails = ProductDetails.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
