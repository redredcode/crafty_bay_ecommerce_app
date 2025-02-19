import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email, String password) async {

    bool isSuccess = false;
    _inProgress = true;
    update();

    final requestParams = {
      "email": email,
      "password": password,
    };
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.verifyEmailUrl, body: requestParams);
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}