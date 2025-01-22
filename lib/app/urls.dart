class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api'; // https://craftybay.teamrabbil.com/api
  static String verifyEmailUrl(String email) => '$_baseUrl/UserLogin/$email'; // might be VerifyLogin
  static String verifyOtpUrl(String email, String otp) => '$_baseUrl/UserLogin/$email/$otp';
}