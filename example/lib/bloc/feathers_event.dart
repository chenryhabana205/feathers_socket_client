/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:49:19
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 19:25:30
 * @ Description:
 */

import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';

abstract class FeathersEvent<T> extends Equatable {
  const FeathersEvent();
}

class AddNew<T> extends FeathersEvent<T> {
  final T instanceToAdd;

  AddNew(this.instanceToAdd);
  @override
  List<Object> get props => [instanceToAdd];
}

class Refresh<T> extends FeathersEvent<T> {
  final List<T> updatedList;

  const Refresh(this.updatedList);
  @override
  // TODO: implement props
  List<Object> get props => [updatedList];
}

class Patch<T> extends FeathersEvent<T> {
  final Map<String, dynamic> data;
  final String id;

  const Patch(this.id, this.data);
  @override
  List<Object> get props => [data];
}

class Remove<T> extends FeathersEvent<T> {
  final T itemToRemove;

  Remove(this.itemToRemove);

  @override
  List<Object> get props => [itemToRemove];
}

class Update<T> extends FeathersEvent<T> {
  final Map<String, dynamic> itemToUpdate;
  final String id;
  Update(this.id, this.itemToUpdate);

  @override
  List<Object> get props => [itemToUpdate];
}
