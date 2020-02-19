/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:44:30
 * @ Modified by: Marcos Rodriguez Toranzo
 * @ Modified time: 2020-02-18 18:56:09
 * @ Description:
 */

import 'package:example/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/freezed_classes.dart';

class SlidabelListTile extends StatelessWidget {
  const SlidabelListTile({Key key, this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<FeathersBloc<Todo>>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: <Widget>[
        IconSlideAction(
            caption: 'Delete',
            color: Theme.of(context).cardColor,
            icon: Icons.delete,
            foregroundColor: Colors.red,
            onTap: () {
              _bloc.add(Remove<Todo>(todo));
            }),
        todo.completed
            ? IconSlideAction(
                caption: 'Uncheck',
                color: Theme.of(context).cardColor,
                icon: Icons.radio_button_unchecked,
                foregroundColor: Colors.yellow,
                onTap: () {
                  _bloc.add(
                    Patch<Todo>(todo.id,
                        todo.copyWith(completed: !todo.completed).toJson()),
                    // Update<Todo>(todo.copyWith(completed: !todo.completed)),
                  );
                })
            : IconSlideAction(
                caption: 'Check',
                color: Theme.of(context).cardColor,
                icon: Icons.check_circle_outline,
                foregroundColor: Colors.green,
                onTap: () {
                  _bloc.add(
                    Patch<Todo>(todo.id,
                        todo.copyWith(completed: !todo.completed).toJson()),
                    // Update<Todo>(todo.copyWith(completed: !todo.completed)),
                  );
                }),
      ],
      child: ListTile(
        title: Text(
          todo.name,
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          todo.description,
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: Icon(
          todo.completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: Colors.greenAccent,
        ),
        isThreeLine: true,
        onTap: () {
          var updated = todo.copyWith(completed: true);
          _bloc.add(Patch<Todo>(updated.id, updated.toJson()));
        },
      ),
    );
  }
}
