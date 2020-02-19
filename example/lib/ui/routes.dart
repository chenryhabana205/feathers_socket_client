/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:42:39
 * @ Modified by: Marcos Rodriguez Toranzo
 * @ Modified time: 2020-02-18 18:56:13
 * @ Description:
 */

import 'package:auto_route/auto_route_annotations.dart';

import 'pages/LoginPage.dart';
import 'pages/Todospage.dart';

@autoRouter
class $Router {
  // use @initial or @CupertinoRoute(initial: true) to annotate your initial route.
  @initial
  LoginPage loginPage; // your desired route name

  TodoPage home;
}
