import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce_app/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _shouldNavigateToCompleteProfile = false;

  bool get shouldNavigateToCompleteProfile => _shouldNavigateToCompleteProfile;

  String? _token;
  String? get token => _token;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.verifyOtpUrl);
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responseData['data'];
      await Get.find<ReadProfileController>().readProfileData(token);
      if (Get.find<ReadProfileController>().profileModel == null) {
        _shouldNavigateToCompleteProfile = true;
      } else {
        // Save profile data and access token
        await Get.find<AuthController>().saveUserDataAndAccessToken(token, Get.find<ReadProfileController>().profileModel!);
        _shouldNavigateToCompleteProfile = false;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}