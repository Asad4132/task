import 'package:dio/dio.dart';
import 'package:task/network/WebService.dart';
import 'package:task/preferences/PreferenceManager.dart';

class TaskApp {
  static WebService restClient;
  static PreferenceManager preferenceManager;

  static WebService getWebService() {
    restClient = null;
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.headers["Demo-Header"] = "demo header";
    dio.options.headers["Content-Type"] = "application/json";
    restClient = WebService(dio);
    return restClient;
  }

  static PreferenceManager getPreferenceManager() {
    if (preferenceManager == null) {
      preferenceManager = PreferenceManager();
    }
    return preferenceManager;
  }

  static void erasePreferenceManager() {
    preferenceManager.logout();
  }
}
