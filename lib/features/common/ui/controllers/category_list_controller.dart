import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:ecommerce_app/features/home/data/models/slider_pagination_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  CategoryListModel? _categoryListModel;

  List<CategoryModel> get categoryList =>
      _categoryListModel?.data?.results ?? [];

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.homeSliderUrl);
    if (response.isSuccess) {
      _categoryListModel =
          CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
