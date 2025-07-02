import 'package:application/core/app_export.dart';
import 'package:application/core/constants/api_end_points.dart';
import 'package:application/data/models/response_model/response_model.dart';
import 'package:application/presentation/login_screen/model/login_response_model.dart';
import 'package:dio/dio.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {}
  @override
  void onReady() {
    super.onReady();
  }

  final Dio _dio = Dio(BaseOptions(
    headers: {
      "Accept": "application/json",
    },
    connectTimeout: Duration(seconds: 10),
    baseUrl: ApiEndPoints.baseUrl,
  ));

  Future login(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      Map requestData = const {}}) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.loginEndPoint,
        data: requestData,
      );
      if (response.statusCode == 200) {
        onSuccess!(LoginResponseModel.fromJson(response.data));
      }
    } catch (e) {
      onError!(e);
    }
  }

  Future register(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      Map requestData = const {}}) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.registerEndPoint,
        data: requestData,
      );
      if (response.statusCode == 201) {
        onSuccess!(ResponseModel.fromJson(response.data));
      }
    } catch (e) {
      onError!(e);
    }
  }
}
