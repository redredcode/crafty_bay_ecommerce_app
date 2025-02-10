class Urls {
  static const String _baseUrl =
      'https://ecommerce-api.codesilicon.com/api'; // https://craftybay.teamrabbil.com/api
  static String verifyEmailUrl= '$_baseUrl/UserLogin/';

  static String verifyOtpUrl(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile = '$_baseUrl/ReadProfile';
}
