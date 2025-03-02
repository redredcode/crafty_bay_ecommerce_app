class Urls {

  // user
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';  //'https://ecommerce-api.codesilicon.com/api';
  static String signInUrl= '$_baseUrl/auth/login';
  static String signUpUrl= '$_baseUrl/auth/signup';
  static String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static String readProfile = '$_baseUrl/auth/profile';

  // brand

  // category
  static String categoryListUrl = '$_baseUrl/categories'; // get category list
  static String createCategoryUrl = '$_baseUrl/category'; // create category (admin)
  //static String categoryListUrl = '$_baseUrl/categories'; // get category list

  // product
  static String productDetailsUrl(int productId) => '$_baseUrl/products/id/:$productId'; // get product list
  ///static String productSearch = '$_baseUrl/product/search';

  // product review

  // Cart and wishlist

  // Slide
  static String homeSliderUrl = '$_baseUrl/slides';
}
