import 'package:flutter/material.dart';
import 'package:musiclibrary/ui/dashboard/dashboard_page.dart';

///
/// This class contains all information related to routing
///
class RouteName {
  static final String root = "/";
}

class Routes {
  static final baseRoutes = <String, WidgetBuilder>{
    RouteName.root: (context) => DashBoardPage(),
  };
}
