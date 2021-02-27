import 'package:dio/dio.dart';
import 'package:task/TaskApp.dart';
import 'package:task/base/BasePresenter.dart';
import 'package:task/login/model/User.dart';
import 'package:task/tasks/model/PostBodyUpdateTask.dart';
import 'package:task/tasks/view/TasksPageMVPView.dart';

//ignore_for_file: unnecessary_statements

class UpdateTaskManager extends BasePresenter<TasksPageMVPView> {
  Future updateTask(String id, bool completed) async {
    try {
      UserClass user = await TaskApp.getPreferenceManager().getUser();
      var result = await TaskApp.getWebService()
          .updateTask(id, "application/json", "Bearer ${user.token}",
              PostBodyUpdateTask(completed: !completed))
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
        isViewAttached ? getView().onUpdateTask(result) : null;
      }
    } catch (e) {
      isViewAttached ? getView().showError(e.toString()) : null;
    }
  }
}
