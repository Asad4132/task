//import 'dart:convert';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:task/login/model/PostBodyLogin.dart';
import 'package:task/login/model/User.dart';
import 'package:task/network/EndPoints.dart';
import 'package:task/tasks/model/IsTaskCreated.dart';
import 'package:task/tasks/model/IsTaskDeleted.dart';
import 'package:task/tasks/model/IsTaskUpdated.dart';
import 'package:task/tasks/model/PostBodyCreateTask.dart';
import 'package:task/tasks/model/PostBodyUpdateTask.dart';
import 'package:task/tasks/model/Task.dart';

part 'WebService.g.dart';

@RestApi(baseUrl: "https://api-nodejs-todolist.herokuapp.com/")
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @POST(Endpoints.LOGIN)
  Future<UserClass> login(
      @Header("Content-Type") String type, @Body() PostBodyLogin body);

  @GET(Endpoints.GET_TASKS)
  Future<Task> getTasks(@Header("Content-Type") String type,
      @Header("Authorization") String auth);

  @DELETE(Endpoints.DELETE_TASK)
  Future<IsTaskDeleted> deleteTask(
      @Path("id") String id,
      @Header("Content-Type") String type,
      @Header("Authorization") String auth);

  @POST(Endpoints.GET_TASKS)
  Future<IsTaskCreated> addTask(@Header("Content-Type") String type,
      @Header("Authorization") String auth, @Body() PostBodyCreateTask body);

  @PUT(Endpoints.DELETE_TASK)
  Future<IsTaskUpdated> updateTask(
      @Path("id") String id,
      @Header("Content-Type") String type,
      @Header("Authorization") String auth,
      @Body() PostBodyUpdateTask body);
}
