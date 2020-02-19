/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:43:20
 * @ Modified by: Marcos Rodriguez Toranzo
 * @ Modified time: 2020-02-18 18:55:50
 * @ Description:
 */

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:example/bloc/bloc.dart';
import 'package:example/bloc/feathers_bloc.dart';
import 'package:example/models/freezed_classes.dart';
import 'package:example/ui/widgets/new_todo_body.dart';
import 'package:example/ui/widgets/slidable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../injector_container.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  FeathersBloc<Todo> _bloc;
  @override
  void initState() {
    super.initState();

    _bloc = sl<FeathersBloc<Todo>>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text("widget.title"),
          // ),
          backgroundColor: Colors.deepPurple[600],
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Container(
              //   width: 400,
              //   height: 600,
              //   child: Image.asset(
              //     'assets/images/image.png',
              //     // 'images/test.jpg',
              //     fit: BoxFit.contain,
              //   ),
              // ),
              Positioned(
                child: Text(
                  "Tareas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                top: 40,
                left: 20,
              ),
              DraggableScrollableSheet(
                maxChildSize: 0.85,
                minChildSize: 0.1,
                builder:
                    (BuildContext context, ScrollController scrolController) {
                  return Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                          ),
                          child: BlocConsumer<FeathersBloc<Todo>,
                              FeathersState<Todo>>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return ListView.builder(
                                // padding: EdgeInsets.all(0),
                                // physics: const BouncingScrollPhysics(),
                                itemCount: state.list.length,
                                // state.boardsList[index]
                                controller: scrolController,
                                itemBuilder: (BuildContext context, int index) {
                                  return SlidabelListTile(
                                    todo: state.list[index],
                                  );
                                },
                              );
                            },
                          )),
                      Positioned(
                        child: FloatingActionButton(
                          onPressed: () {
                            AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                body: NewTodo(
                                  bloc: _bloc,
                                )).show();
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        top: -30,
                        right: 30,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
