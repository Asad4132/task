import 'package:task/base/BaseMVPView.dart';
import 'package:task/tasks/model/IsTaskCreated.dart';
import 'package:task/tasks/model/IsTaskDeleted.dart';
import 'package:task/tasks/model/IsTaskUpdated.dart';
import 'package:task/tasks/model/Task.dart';

abstract class TasksPageMVPView implements BaseMVPView {
  onLoadTasks(Task result);
  onDeleteTask(IsTaskDeleted result);
  onUpdateTask(IsTaskUpdated result);
  onCreateTask(IsTaskCreated result);
}
