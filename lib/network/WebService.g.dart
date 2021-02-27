// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WebService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WebService implements WebService {
  _WebService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api-nodejs-todolist.herokuapp.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserClass> login(type, body) async {
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('user/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Content-Type': type},
            extra: _extra,
            contentType: type,
            baseUrl: baseUrl),
        data: _data);
    final value = UserClass.fromJson(_result.data);
    return value;
  }

  @override
  Future<Task> getTasks(type, auth) async {
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('task',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'Content-Type': type,
              r'Authorization': auth
            },
            extra: _extra,
            contentType: type,
            baseUrl: baseUrl),
        data: _data);
    final value = Task.fromJson(_result.data);
    return value;
  }

  @override
  Future<IsTaskDeleted> deleteTask(id, type, auth) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('task/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{
              r'Content-Type': type,
              r'Authorization': auth
            },
            extra: _extra,
            contentType: type,
            baseUrl: baseUrl),
        data: _data);
    final value = IsTaskDeleted.fromJson(_result.data);
    return value;
  }

  @override
  Future<IsTaskCreated> addTask(type, auth, body) async {
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(auth, 'auth');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('task',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'Content-Type': type,
              r'Authorization': auth
            },
            extra: _extra,
            contentType: type,
            baseUrl: baseUrl),
        data: _data);
    final value = IsTaskCreated.fromJson(_result.data);
    return value;
  }

  @override
  Future<IsTaskUpdated> updateTask(id, type, auth, body) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(auth, 'auth');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('task/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{
              r'Content-Type': type,
              r'Authorization': auth
            },
            extra: _extra,
            contentType: type,
            baseUrl: baseUrl),
        data: _data);
    final value = IsTaskUpdated.fromJson(_result.data);
    return value;
  }
}
