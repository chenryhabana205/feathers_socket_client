/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:49:19
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 19:25:33
 * @ Description:
 */

import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';

class FeathersState<T> extends Equatable {
  final BuiltList<T> list;
  const FeathersState({this.list});

  @override
  List<Object> get props => [list];

  FeathersState<T> copyWith(BuiltList<T> list) {
    return FeathersState<T>(list: list ?? this.list);
  }

  factory FeathersState.initial() => FeathersState<T>(list: BuiltList<T>());
}
