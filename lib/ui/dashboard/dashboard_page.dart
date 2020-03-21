import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/common/app_theme.dart';
import 'package:flutterprojectsetup/ui/common/bloc_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<DashBoardPage> {
  AppTheme _appTheme;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1242, height: 2688, allowFontScaling: false);
    _appTheme = BlocProvider.of(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Music Library",
          style: _appTheme.appBarTextStyle,
        ),
        backgroundColor: _appTheme.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getTitleAndAuthors(),
          _getSongs(),
          _getCopyRightsText(),
          SizedBox(height: _appTheme.getResponsiveHeight(100),),
        ],
      ),
    );
  }

  Widget _getSongs() {
    return CarouselSlider.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 100,
      enableInfiniteScroll: true,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
      height: MediaQuery.of(context).size.width,
      aspectRatio: 1 / 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _appTheme.getResponsiveWidth(10),
              vertical: _appTheme.getResponsiveHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  "https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/b1/9f/66/b19f6600-640a-ae56-d6ab-1effaaf23afe/886448363347.jpg/200x200bb.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Master (Original Motion Picture Soundtrack)",
                    textAlign: TextAlign.center,
                    style: _appTheme.songTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _getTitleAndAuthors() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
          horizontal: _appTheme.getResponsiveWidth(30),
          vertical: _appTheme.getResponsiveHeight(20)),
      child: Card(
        color: _appTheme.whiteColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: _appTheme.getResponsiveHeight(300),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  "http://itunes.apple.com/favicon.ico",
                  fit: BoxFit.cover,
                ),
              ),
              _getTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "New Indian Releases",
          textAlign: TextAlign.center,
          style: _appTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          "by iTunes Store",
          textAlign: TextAlign.center,
          style: _appTheme.subtitleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          "Country : IN",
          textAlign: TextAlign.center,
          style: _appTheme.subtitleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )
      ],
    );
  }

  _getCopyRightsText() {
    return Text(
      "Copyright © 2018 Apple Inc. All rights reserved.",
      style: _appTheme.copyRightsTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
