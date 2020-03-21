import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/dashboard/dashboard_page.dart';

class RouteName{
  static final String root = "/";
  static final String  songDetailPage= "song_detail_page";
}

class Routes{
  static final baseRoutes = <String,WidgetBuilder>{
    RouteName.root :(context) => DashBoardPage(),
/*    RouteName.songDetailPage :(context) => LoginPage()*/
  };
}