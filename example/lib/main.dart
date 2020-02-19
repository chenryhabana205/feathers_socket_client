/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:01:29
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 19:25:35
 * @ Description:
 */

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'injector_container.dart';

import 'ui/routes.gr.dart';

void main() async {
  await initInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Material App',
        onGenerateRoute: Router.onGenerateRoute,
        initialRoute: Router.loginPage,
      ),
    );
  }
}
