import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/dashboard/dashboard_page.dart';

class RouteName{
  static final String root = "/";
}

class Routes{
  static final baseRoutes = <String,WidgetBuilder>{
    RouteName.root :(context) => DashBoardPage(),
  };
}