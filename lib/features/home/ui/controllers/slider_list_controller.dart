import 'package:ecommerce_app/features/home/data/models/slider_list_data_model.dart';
import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  PaginationModel? _sliderListDataModel; // we created this SliderListDataModel instance to use the .fromJason method from it (used in line 31)

  List<SliderModel> get sliderBannerList =>
      _sliderListDataModel?.results ?? <SliderModel>[];

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.homeSliderUrl);
    if (response.isSuccess) {
      _sliderListDataModel =
          PaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
