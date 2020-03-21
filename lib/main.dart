import 'package:flutter/material.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/routes.dart';

import 'ui/common/bloc_provider.dart';

void main() => runApp(MusicLibraryApp());

class MusicLibraryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AppTheme(),
      child: MaterialApp(
        initialRoute: RouteName.root,
        routes: Routes.baseRoutes,
      ),
    );
  }
}
