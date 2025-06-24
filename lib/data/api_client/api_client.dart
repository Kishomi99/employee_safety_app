import 'package:get/get_connect/connect.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
