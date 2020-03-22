import 'package:flutter/material.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:shimmer/shimmer.dart';

///
/// This class provides shimmer widget when data is being fetched from server
///
class ShimmerWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final double borderRadius;

  ShimmerWidget(
      {this.padding,
      this.margin,
      this.width = 150,
      this.height = 180,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    AppThemeState _appThemeState = AppTheme.of(context);
    return ShimmerWrapper(
      child: Container(
        padding: padding != null ? padding : null,
        margin: margin != null ? margin : null,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _appThemeState.shimmerBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerWrapper extends StatelessWidget {
  final Widget child;

  ShimmerWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    AppThemeState _appThemeState = AppTheme.of(context);
    return Shimmer.fromColors(
      baseColor: _appThemeState.shimmerBaseColor,
      highlightColor: _appThemeState.shimmerHighlightColor,
      child: child,
    );
  }
}
