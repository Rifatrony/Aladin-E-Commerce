// ignore_for_file: file_names

abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> getApiWithoutHeader(String url);
  Future<dynamic> loginApi(dynamic data, String url);
  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> postApiWithRawData(dynamic data, String url);
}