/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:39:54
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 19:43:24
 * @ Description:
 */

import 'package:feathers_socket_client/featherjs_client.dart';
import 'package:get_it/get_it.dart';

import 'models/freezed_classes.dart';
import 'bloc/bloc.dart';

final sl = GetIt.instance;
Future initInjection() async {
  String url = 'https://featherflutterapi.qvaweb.com/';
  FeatherClient _featherClient = FeatherClient(serverUrl: url, debug: true)
    ..init();

  sl.registerLazySingleton(() => _featherClient);
  sl.registerFactory(() => FeathersBloc<Todo>(sl(), 'todos',
      (json) => Todo.fromJson(json), (Todo todo) => todo.toJson()));
}
