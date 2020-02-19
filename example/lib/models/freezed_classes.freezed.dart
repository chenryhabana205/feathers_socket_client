// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'freezed_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

mixin _$Todo {
  String get name;
  String get description;
  bool get completed;
  String get ownerId;
  @JsonKey(name: '_id')
  String get id;

  Todo copyWith(
      {String name,
      String description,
      bool completed,
      String ownerId,
      @JsonKey(name: '_id') String id});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Todo with DiagnosticableTreeMixin implements _Todo {
  const _$_Todo(this.name, this.description, this.completed,
      {this.ownerId, @JsonKey(name: '_id') this.id})
      : assert(name != null),
        assert(description != null),
        assert(completed != null);

  factory _$_Todo.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final bool completed;
  @override
  final String ownerId;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(name: $name, description: $description, completed: $completed, ownerId: $ownerId, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('ownerId', ownerId))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      description.hashCode ^
      completed.hashCode ^
      ownerId.hashCode ^
      id.hashCode;

  @override
  _$_Todo copyWith({
    Object name = freezed,
    Object description = freezed,
    Object completed = freezed,
    Object ownerId = freezed,
    Object id = freezed,
  }) {
    assert(name != null);
    assert(description != null);
    assert(completed != null);
    return _$_Todo(
      name == freezed ? this.name : name as String,
      description == freezed ? this.description : description as String,
      completed == freezed ? this.completed : completed as bool,
      ownerId: ownerId == freezed ? this.ownerId : ownerId as String,
      id: id == freezed ? this.id : id as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoToJson(this);
  }
}

abstract class _Todo implements Todo {
  const factory _Todo(String name, String description, bool completed,
      {String ownerId, @JsonKey(name: '_id') String id}) = _$_Todo;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  bool get completed;
  @override
  String get ownerId;
  @override
  @JsonKey(name: '_id')
  String get id;

  @override
  _Todo copyWith(
      {String name,
      String description,
      bool completed,
      String ownerId,
      @JsonKey(name: '_id') String id});
}
