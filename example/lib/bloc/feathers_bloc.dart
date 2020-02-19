/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:49:19
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 19:25:48
 * @ Description:
 */

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:feathers_socket_client/feathers_socket_client.dart';
import './bloc.dart';

class FeathersBloc<T> extends Bloc<FeathersEvent<T>, FeathersState<T>> {
  FeatherClient _featherClient;
  String _collection;
  Function _deserializeFunction;
  Function _serializeFunction;
  StreamSubscription newSubcription;
  FeathersBloc(this._featherClient, this._collection, this._deserializeFunction,
      this._serializeFunction) {
    var stream = _featherClient.listenToList<T>(
        collectionName: _collection, deserializeFunction: _deserializeFunction);
    newSubcription = stream.asBroadcastStream().listen((updatedList) {
      add(Refresh<T>(updatedList));
    });
  }

  @override
  FeathersState<T> get initialState => FeathersState<T>.initial();

  @override
  Stream<FeathersState<T>> mapEventToState(
    FeathersEvent<T> event,
  ) async* {
    if (event is AddNew<T>) {
      _featherClient.add<T>(_collection,
          query: _serializeFunction(event.instanceToAdd));
    } else if (event is Refresh<T>) {
      yield state.copyWith(BuiltList.from(event.updatedList));
    } else if (event is Patch<T>) {
      var response = await _featherClient.update(_collection,
          id: event.id, query: event.data);
      print(response);
    } else if (event is Remove<T>) {
      var response = await _featherClient.remove(_collection,
          query: _serializeFunction(event.itemToRemove));
      print(response);
    } else if (event is Update<T>) {
      var response = await _featherClient.update(_collection,
          query: _serializeFunction(event.itemToUpdate));
      print(response);
    }
  }

  @override
  Future<void> close() {
    newSubcription.cancel();
    return super.close();
  }
}
