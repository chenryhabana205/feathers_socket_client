/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:41:47
 * @ Modified by: Marcos Rodriguez Toranzo
 * @ Modified time: 2020-02-18 18:55:04
 * @ Description:
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'freezed_classes.freezed.dart';
part 'freezed_classes.g.dart';

// @immutable
@freezed
abstract class Todo with _$Todo {
  const factory Todo(
    String name,
    String description,
    bool completed, {
    String ownerId,
    @JsonKey(name: '_id') String id,
  }) = _Todo;
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
