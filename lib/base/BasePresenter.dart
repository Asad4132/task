import 'dart:io';

import 'package:dio/dio.dart';

abstract class BasePresenter<T> {
  T view;
  void attachView(T view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }

  bool get isViewAttached {
    return view != null;
  }

  void checkViewAttached() {
    if (view == null) {
      throw new Exception("attached view is null!");
    }
  }

  T getView() {
    return view;
  }

  String handleError(var obj) {
    final res = (obj as DioError).response;
    if (res != null) {
      if (res.statusCode != 200) return res.statusMessage;
      if (res.data.toString().isNotEmpty)
        return res.data["error_description"];
      else if (res.statusCode != null)
        return "${res.statusCode} -> ${res.statusMessage}";
      else
        return 'Unknown Error';
    } else {
      DioError temp = obj as DioError;
      if (temp.error is String) {
        return temp.error;
      } else {
        SocketException temp1 = temp.error as SocketException;
        if (temp1.osError.errorCode == 7)
          return 'Connection Error';
        else
          return temp.error.toString();
      }
    }
  }

  // String handleError(var obj) {
  //   Logger().e('Error');
  //   final res = (obj as DioError).response;
  //   if (res != null) {
  //     Logger().e(res);
  //     if (res.statusCode == 503) return res.statusMessage;
  //     if (res.data.toString().isNotEmpty)
  //       return res.data["error_description"];
  //     else if (res.statusCode != null)
  //       return "${res.statusCode} -> ${res.statusMessage}";
  //     else
  //       return 'Unknown Error';
  //   } else {
  //     DioError temp = obj as DioError;
  //     if (temp.error is String) {
  //       return temp.error;
  //     } else {
  //       SocketException temp1 = temp.error as SocketException;
  //       Logger().e(temp.error.toString());
  //       if (temp1.osError.errorCode == 7)
  //         return 'Connection Error';
  //       else
  //         return temp.error.toString();
  //     }
  //   }
  // }
}
