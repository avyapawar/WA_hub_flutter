abstract class BaseApiServices {
  Future<dynamic> postApiResponse(String url, dynamic data);
  Future <dynamic> getApiResponse(String url  ) ;
    Future <dynamic> getApiResponseWithHeader(String url ,dynamic data ) ;

}
