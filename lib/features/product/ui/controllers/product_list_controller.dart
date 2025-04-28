import 'package:ecommerce_app/features/product/data/models/product_list_pagination_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';

class ProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  //ProductListPaginationModel get productDetails => _productListPaginationModel;

  Future<bool> getProductListByCategory(int? category) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams ={
      //'brand' : brand,
      'category' : category,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      ProductListPaginationModel productListPaginationModel = ProductListPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
