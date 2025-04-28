import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../data/models/product_list_pagination_model.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductModel _productModel = ProductModel();

  ProductModel get productModel => _productModel;

  Future<bool> getProductDetails(int productID) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productDetailsUrl(productID),
    );
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
