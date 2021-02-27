import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task/Utilities.dart';
import 'package:task/tasks/model/IsTaskCreated.dart';
import 'package:task/tasks/model/IsTaskDeleted.dart';
import 'package:task/tasks/model/IsTaskUpdated.dart';
import 'package:task/tasks/model/Task.dart';
import 'package:task/tasks/presenter/CreateTaskManager.dart';
import 'package:task/tasks/presenter/DeleteTaskManager.dart';
import 'package:task/tasks/presenter/TasksManager.dart';
import 'package:task/tasks/presenter/UpdateTaskManager.dart';
import 'package:task/tasks/view/TasksPageMVPView.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> implements TasksPageMVPView {
  Task task;
  TasksManager tasksManager;
  CreateTaskManager createTaskManager;
  DeleteTaskManager deleteTaskManager;
  UpdateTaskManager updateTaskManager;
  int showLoader = 1;
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tasksManager = TasksManager();
    tasksManager.attachView(this);
    tasksManager.getTasks();
    createTaskManager = CreateTaskManager();
    createTaskManager.attachView(this);
    deleteTaskManager = DeleteTaskManager();
    deleteTaskManager.attachView(this);
    updateTaskManager = UpdateTaskManager();
    updateTaskManager.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    Color(0xff0c0c64),
                    Color(0xff0c0c64),
                  ])),
            ),
            title: Text('Tasks'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: task == null && showLoader == 0
                      ? Center(child: Text('No Data Found'))
                      : ListView.builder(
                          itemCount: task == null ? 0 : task.count,
                          itemBuilder: (context, index) {
                            final taskData = task.data[index];

                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.4,
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: taskData.completed
                                      ? 'Mark Un-complete'
                                      : 'Mark Complete',
                                  color: taskData.completed
                                      ? Colors.blue
                                      : Colors.green,
                                  icon: taskData.completed
                                      ? Icons.clear
                                      : Icons.check,
                                  onTap: () {
                                    updateTaskManager.updateTask(
                                        taskData.sId, taskData.completed);
                                    setState(() {
                                      showLoader++;
                                    });
                                  },
                                ),
                              ],
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () {
                                    deleteTaskManager.deleteTask(taskData.sId);
                                    setState(() {
                                      showLoader++;
                                    });
                                  },
                                ),
                              ],
                              child: Card(
                                color: taskData.completed
                                    ? Colors.green
                                    : Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          taskData.description,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _descriptionController,
                        validator: (val) =>
                            val.length < 6 ? 'Password too short.' : null,
                        decoration: InputDecoration(
                          hintText: 'Description',
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blueAccent.shade700,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.blue.shade300, fontSize: 16),
                        ),
                      ),
                      onPressed: () {
                        if (_descriptionController.text.isNotEmpty) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _descriptionController.text = '';
                          createTaskManager
                              .createTask(_descriptionController.text);
                          setState(() {
                            showLoader++;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Visibility(
              visible: showLoader == 0 ? false : true,
              child: Theme(
                  data: ThemeData(
                      cupertinoOverrideTheme:
                          CupertinoThemeData(brightness: Brightness.light)),
                  child: CupertinoActivityIndicator(
                    radius: 30,
                  ))),
        )
      ],
    );
  }

  @override
  onLoadTasks(Task result) {
    setState(() {
      showLoader--;
      task = result;
    });
  }

  @override
  void showError(String desc) {
    setState(() {
      showLoader--;
    });
    desc != null
        ? Utilities.showRedToast(desc)
        : Utilities.showRedToast('Unknown Error');
  }

  @override
  onCreateTask(IsTaskCreated result) {
    tasksManager.getTasks();
  }

  @override
  onDeleteTask(IsTaskDeleted result) {
    tasksManager.getTasks();
  }

  @override
  onUpdateTask(IsTaskUpdated result) {
    tasksManager.getTasks();
  }
}
