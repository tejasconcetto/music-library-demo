import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme extends BlocBase{

  Color get primaryColor => Colors.black87;
  double getResponsiveFont(double value) => ScreenUtil().setSp(value);
  double getResponsiveWidth(double value) => ScreenUtil().setWidth(value);
  double getResponsiveHeight(double value) => ScreenUtil().setHeight(value);
  Color get whiteColor => Colors.white;

  TextStyle get appBarTextStyle => TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFont(56)
  );

  TextStyle get songTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFont(46)
  );

  TextStyle get titleTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w900,
      fontSize: getResponsiveFont(56)
  );

  TextStyle get subtitleTextStyle => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFont(45)
  );

  TextStyle get copyRightsTextStyle => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFont(45)
  );
  
  @override
  void dispose() {

  }
}