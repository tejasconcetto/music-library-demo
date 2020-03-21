import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musiclibrary/di/api_interface.dart';
import 'package:musiclibrary/models/song_data.dart';
import 'package:musiclibrary/models/song_details.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/bloc_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:musiclibrary/ui/common/shimmer_widget.dart';
import 'package:musiclibrary/ui/common/strings.dart';
import 'package:musiclibrary/ui/song_details/song_details_page.dart';

import 'carousel_slider_item.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<DashBoardPage> {
  AppTheme _appTheme;
  StreamController<SongData> _fetchSongDataStreamController =
      StreamController();
  SongData _songData;

  @override
  void initState() {
    super.initState();
    _fetchSongList();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1242, height: 2688, allowFontScaling: false);
    _appTheme = BlocProvider.of(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appBarTitle,
          style: _appTheme.appBarTextStyle,
        ),
        backgroundColor: _appTheme.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<SongData>(
          stream: _fetchSongDataStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _songData = snapshot.data;
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _getTitleAndAuthors(),
                _getSongs(),
                _getCopyRightsText(),
                SizedBox(
                  height: _appTheme.getResponsiveHeight(100),
                ),
              ],
            );
          }),
    );
  }

  Widget _getSongs() {
    return CarouselSlider.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _songData != null ? _songData?.feed?.results?.length : 10,
      enableInfiniteScroll: true,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
      height: MediaQuery.of(context).size.width,
      aspectRatio: 1 / 1,
      itemBuilder: (BuildContext context, int index) {
        return CarouselItem(
          _songData != null ? _songData?.feed?.results[index] : null,
          onItemClicked: _showSongDetails,
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
                  child: _fetchIconWidget()),
              _songData != null ? _getTitle() : _getTitleShimmer()
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
          _songData?.feed?.title ?? "",
          textAlign: TextAlign.center,
          style: _appTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          Strings.by + _songData?.feed?.author?.name ?? "",
          textAlign: TextAlign.center,
          style: _appTheme.subtitleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          Strings.country + _songData?.feed?.country ?? "",
          textAlign: TextAlign.center,
          style: _appTheme.subtitleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )
      ],
    );
  }

  Widget _getTitleShimmer() {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShimmerWidget(
            width: MediaQuery.of(context).size.width,
            height: _appTheme.getResponsiveHeight(50),
            margin: EdgeInsets.only(right: _appTheme.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
          SizedBox(
            height: _appTheme.getResponsiveHeight(15),
          ),
          ShimmerWidget(
            width: MediaQuery.of(context).size.width,
            height: _appTheme.getResponsiveHeight(50),
            margin: EdgeInsets.only(right: _appTheme.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
          SizedBox(
            height: _appTheme.getResponsiveHeight(15),
          ),
          ShimmerWidget(
            width: MediaQuery.of(context).size.width,
            height: _appTheme.getResponsiveHeight(50),
            margin: EdgeInsets.only(right: _appTheme.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
        ],
      ),
    );
  }

  _getCopyRightsText() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _appTheme.getResponsiveWidth(100),
      ),
      child: _songData != null
          ? Text(
              "Copyright © 2018 Apple Inc. All rights reserved.",
              style: _appTheme.copyRightsTextStyle,
              textAlign: TextAlign.center,
            )
          : ShimmerWidget(
              width: MediaQuery.of(context).size.width,
              height: _appTheme.getResponsiveHeight(50),
              borderRadius: 3.0,
            ),
    );
  }

  _showSongDetails(SongDetails songDetails) {
    if (songDetails != null) {
      return showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (builder) {
            return FractionallySizedBox(
              heightFactor: 0.90,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: SongDetailsPage(songDetails),
              ),
            );
          });
    }
  }

  void _fetchSongList() {
    ApiInterface.getInstance()
        .getSongListRepository()
        .fetchSongList()
        .then((songData) {
      _fetchSongDataStreamController.add(songData);
    }).catchError((error) {});
  }

  @override
  void dispose() {
    _fetchSongDataStreamController.close();
    super.dispose();
  }

  Widget _fetchIconWidget() {
    return Container(
      width: _appTheme.getResponsiveWidth(200),
      height: _appTheme.getResponsiveWidth(200),
      child: _songData != null && _songData?.feed?.icon != null
          ? Image.network(
              _songData?.feed?.icon,
              frameBuilder: (context, widget, frame, isLoaded) {
                return frame != null ? widget : _getShimmerIconWidget();
              },
              fit: BoxFit.cover,
            )
          : _getShimmerIconWidget(),
    );
  }

  Widget _getShimmerIconWidget() {
    return ShimmerWidget(
      width: _appTheme.getResponsiveHeight(200),
    );
  }
}
