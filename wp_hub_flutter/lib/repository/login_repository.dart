import 'package:wp_hub_flutter/const/app_url.dart';
import 'package:wp_hub_flutter/data/network/api_services.dart';
import 'package:wp_hub_flutter/data/network/base_api_services.dart';

class LoginRepository {
final   BaseApiServices _apiServices = ApiServices();

  Future<Map<String, dynamic>> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginurl, data);
          print(response) ;
 
      return response;
    } catch (e) {
      rethrow;
    }
  }

   Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.forgotPasswordUrl + email);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
