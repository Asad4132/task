import 'package:dio/dio.dart';
import 'package:task/TaskApp.dart';
import 'package:task/base/BasePresenter.dart';
import 'package:task/login/model/User.dart';
import 'package:task/tasks/view/TasksPageMVPView.dart';

//ignore_for_file: unnecessary_statements

class DeleteTaskManager extends BasePresenter<TasksPageMVPView> {
  Future deleteTask(String id) async {
    try {
      UserClass user = await TaskApp.getPreferenceManager().getUser();
      var result = await TaskApp.getWebService()
          .deleteTask(id, "application/json", "Bearer ${user.token}")
          .catchError((Object obj) {
        // non-200 error goes here.
        switch (obj.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            String error = handleError(obj);
            isViewAttached ? getView().showError(error) : null;
            break;
        }
        return;
      });

      if (result != null) {
        isViewAttached ? getView().onDeleteTask(result) : null;
      }
    } catch (e) {
      isViewAttached ? getView().showError(e.toString()) : null;
    }
  }
}
