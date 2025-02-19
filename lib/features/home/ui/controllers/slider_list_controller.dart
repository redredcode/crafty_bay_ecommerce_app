import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:ecommerce_app/features/home/data/models/slider_pagination_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  SliderPaginationModel? _sliderPaginationModel;

  List<SliderModel> get sliderBannerList =>
      _sliderPaginationModel?.data?.results ?? [];

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.homeSliderUrl);
    if (response.isSuccess) {
      _sliderPaginationModel =
          SliderPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
