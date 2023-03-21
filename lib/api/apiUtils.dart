import 'package:dio/dio.dart';
import 'Api.dart';
import 'CustomLogInterceptor.dart';
import 'LogUtil.dart';
import '../globals.dart' as globals;
final title = "ApiUtils";

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static ApiUtils _apiUtils = ApiUtils._i();
  final Dio _dio = Dio();

  ApiUtils._i() {
    _dio.interceptors.add(CustomLogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));
  }

  factory ApiUtils() {
    return _apiUtils;
  }
  Map<String, String> getsecureHeaders()
  {
    if(globals.userInfo!=null && globals.userInfo!.accessToken!=null)
    {
      return  {
        "Content-Type": "application/json",
        "api-version": "1",
        "Authorization": "Bearer "+ globals.userInfo!.accessToken!.toString()
      };
    }
    return  {
      "Content-Type": "application/json",
      "api-version": "1",
      "Authorization": "Bearer "
      // "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWx3YWZyYWguYXFkZXZlbG9wZXIudGVjaFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NTY3OTMxOTIsIm5iZiI6MTY1Njc5MzE5MiwianRpIjoiZlNzMHhSdmUzeTBPektzcCIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.C9kXzli4617CIcjnxRNizAC3nCSOHegQQgeatw6ropM"
    };
  }
  Map<String, String> header = {"Content-Type": "application/json" ,"Authorization": 'Bearer '+"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWx3YWZyYWguYXFkZXZlbG9wZXIudGVjaFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NTY3OTI3OTIsIm5iZiI6MTY1Njc5Mjc5MiwianRpIjoiM2l0YTRQemN5RUlDN0NqdyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.SBwIvMunyaJMKbuRAUw08zMOoTMNcVe_c3tc4U52D9g"};

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "api-version": "1"
  };
  // final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvM3phcHAuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTY1Mjc4MzY5MywibmJmIjoxNjUyNzgzNjkzLCJqdGkiOiJ5dmtQMWh0TkpSa0JuOFBqIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.NKG3OKHaoDsiQEVlR6HBow7bwCLRhfRUgAjk7kC8vuk";

  Map<String, String> secureHeaders = {
    "Content-Type": "application/json",
    "api-version": "1",
    //"Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWx3YWZyYWguYXFkZXZlbG9wZXIudGVjaFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NTY3OTMxOTIsIm5iZiI6MTY1Njc5MzE5MiwianRpIjoiZlNzMHhSdmUzeTBPektzcCIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.C9kXzli4617CIcjnxRNizAC3nCSOHegQQgeatw6ropM"
  };
  Map<String, String> emptyHeaders = {
    "Content-Type": "application/json"
  };
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    //FormData formData = FormData.fromMap({"name": ""});

    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }
  Future<Response> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    //FormData formData = FormData.fromMap({"name": ""});

    var result = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }
  Future<Response> postWithProgress({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    //
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Options options = Options(headers: secureHeaders);

    //var result = await _dio.delete(api, options: options);
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  String handleError(dynamic error) {
    Api.hideLoading();
    String errorDescription = "";

    Log.loga(title, "handleError:: error >> $error");

    if (error is DioError) {
      Log.loga(
          title, '************************ DioError ************************');

      DioError dioError = error as DioError;
      Log.loga(title, 'dioError:: $dioError');
      if (dioError.response != null) {
        Log.loga(
            title, "dioError:: response >> " + dioError.response.toString());
      }

      switch (dioError.type) {
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    Log.loga(title, "handleError:: errorDescription >> $errorDescription");
    return errorDescription;
  }

  getFormattedError() {
    return {'error': 'Error'};
  }

  getNetworkError() {
    return "No Internet Connection.";
  }
}
