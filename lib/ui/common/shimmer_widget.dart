import 'package:flutter/material.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc_provider.dart';

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
    AppTheme _appTheme = BlocProvider.of(context).bloc;
    return ShimmerWrapper(
      child: Container(
        padding: padding != null ? padding : null,
        margin: margin != null ? margin : null,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _appTheme.shimmerBackgroundColor,
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
    AppTheme _appTheme = BlocProvider.of(context).bloc;
    return Shimmer.fromColors(
      baseColor: _appTheme.shimmerBaseColor,
      highlightColor: _appTheme.shimmerHighlightColor,
      child: child,
    );
  }
}