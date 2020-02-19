/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:44:16
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 20:02:32
 * @ Description:
 */

import 'package:awesome_dialog/animated_button.dart';
import 'package:example/bloc/bloc.dart';
import 'package:example/models/freezed_classes.dart';
import 'package:flutter/material.dart';

import 'custom_edit_text.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key key, @required this.bloc}) : super(key: key);
  final FeathersBloc bloc;
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconedEditText(
              controller: titleController,
              icon: Icons.text_fields,
              hint: 'Title',
              textType: TextInputType.emailAddress,
              validator: (String value) {
                if (value.isEmpty)
                  return 'The title cannot be empty';
                else
                  return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            IconedEditText(
                controller: descController,
                icon: Icons.description,
                hint: 'Description',
                validator: (String value) {
                  if (value.isEmpty)
                    return 'The description cannot be empty';
                  else
                    return null;
                }),
            SizedBox(
              height: 10,
            ),
            AnimatedButton(
              text: 'Add Todo',
              pressEvent: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).pop();
                  Todo todo =
                      Todo(titleController.text, descController.text, false);
                  widget.bloc.add(AddNew<Todo>(todo));
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
