// ignore_for_file: file_names

class AppUrl {
  static const String baseUrl = 'https://faruqtraders.com/api/v1';
  static const String loginUrl = '$baseUrl/auth/user/login';

  static const String profileUrl = '$baseUrl/user/profile';
  static const String updateProfileUrl = '$baseUrl/user/profile/update';

  static const String featureUrl = '$baseUrl/product/featured';
  static const String saleUrl = '$baseUrl/product/sale';
  static const String bestSellingUrl = '$baseUrl/product/sellings';
  static const String latestUrl = '$baseUrl/product/sale';
  static const String topInCategoriesUrl = '$baseUrl/product/products';

  static const String categoryUrl = '$baseUrl/category/index';
  static const String productDetailsUrl = '$baseUrl/product/details';

  static const String addToCartUrl = '$baseUrl/carts/add';
  static const String getCartUrl = '$baseUrl/carts';
  static const String incrementCartUrl = '$baseUrl/carts';
  static const String decrementCartUrl = '$baseUrl/carts';

  static const String orderUrl = '$baseUrl/user/orders';
  static const String orderDetailsUrl = '$baseUrl/user/order/details';

  static const String deliveryMethodUrl = '$baseUrl/checkout/delivery/methods';

}