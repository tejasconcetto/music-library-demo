import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// This class contains all UI related styles
///
class AppTheme extends StatefulWidget {
  final Widget child;

  AppTheme({
    @required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return AppThemeState();
  }

  static AppThemeState of(BuildContext context) {
    final _InheritedStateContainer inheritedStateContainer =
        context.dependOnInheritedWidgetOfExactType();
    if (inheritedStateContainer == null) {
      return AppThemeState();
    } else {
      // temporary solution
      return inheritedStateContainer.data;
    }
  }
}

class AppThemeState extends State<AppTheme> {
  Color get primaryColor => Colors.black87;

  double getResponsiveFont(double value) => ScreenUtil().setSp(value);

  double getResponsiveWidth(double value) => ScreenUtil().setWidth(value);

  double getResponsiveHeight(double value) => ScreenUtil().setHeight(value);

  Color get whiteColor => Colors.white;

  Color get shimmerBackgroundColor => Color(0xff484848).withOpacity(0.3);

  Color get shimmerBaseColor => Colors.grey[300];

  Color get shimmerHighlightColor => Colors.grey[100];

  TextStyle get appBarTextStyle =>
      TextStyle(color: Colors.white, fontSize: getResponsiveFont(56));

  TextStyle get albumTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFont(46));

  TextStyle get titleTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w900,
      fontSize: getResponsiveFont(56));

  TextStyle get subtitleTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFont(45));

  TextStyle get copyRightsTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFont(45));

  TextStyle get albumDetailTitleTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFont(56));

  TextStyle get artistTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFont(50));

  TextStyle get releaseTextStyle => TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFont(45));

  TextStyle get closeTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFont(50));

  TextStyle get releasedLabelTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFont(45));

  TextStyle get internetConnectionTextStyle => TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFont(40));

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final AppThemeState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
