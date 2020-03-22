import 'package:flutter/material.dart';
import 'package:musiclibrary/di/api_interface.dart';
import 'package:musiclibrary/models/album_data.dart';
import 'package:musiclibrary/models/album_details.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/bloc_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:musiclibrary/ui/common/constants.dart';
import 'package:musiclibrary/ui/common/network_manager.dart';
import 'package:musiclibrary/ui/common/shimmer_widget.dart';
import 'package:musiclibrary/ui/common/strings.dart';
import 'package:musiclibrary/ui/album_details/album_details_page.dart';
import 'package:musiclibrary/ui/dashboard/dashboard_bloc.dart';

import '../common/bloc_provider.dart';
import 'carousel_slider_item.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<DashBoardPage> with NetworkManager {
  AppThemeState _appThemeState;

  AlbumData _albumData;
  final dashBoardBloc = DashBoardBloc();

  @override
  void initState() {
    super.initState();
    initialiseNetworkManager();
    networkStream.listen((isConnected) {
      if (isConnected) {
        _fetchAlbumList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: Constants.expectedDeviceWidth,
        height: Constants.expectedDeviceHeight,
        allowFontScaling: false);
    _appThemeState = AppTheme.of(context);
    return BlocProvider<DashBoardBloc>(
      bloc: dashBoardBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.appBarTitle,
            style: _appThemeState.appBarTextStyle,
          ),
          backgroundColor: _appThemeState.primaryColor,
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder<AlbumData>(
            stream: dashBoardBloc.fetchAlbumDataStreamController,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _albumData = snapshot.data;
              }
              return StreamBuilder<bool>(
                  stream: networkStream,
                  builder: (context, snapshot) {
                    return Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _getTitleAndAuthors(),
                            _getAlbums(),
                            _getCopyRightsText(),
                            SizedBox(
                              height: _appThemeState.getResponsiveHeight(100),
                            ),
                          ],
                        ),
                        _getNoInternetWidget(snapshot.hasData && !snapshot.data)

                      ],
                    );
                  });
            }),
      ),
    );
  }

  Widget _getAlbums() {
    return CarouselSlider.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _albumData != null ? _albumData?.feed?.results?.length : 10,
      enableInfiniteScroll: true,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
      height: MediaQuery.of(context).size.width,
      aspectRatio: 1 / 1,
      itemBuilder: (BuildContext context, int index) {
        return CarouselItem(
          _albumData != null ? _albumData?.feed?.results[index] : null,
          onItemClicked: _showAlbumDetails,
        );
      },
    );
  }

  Widget _getTitleAndAuthors() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
          horizontal: _appThemeState.getResponsiveWidth(30),
          vertical: _appThemeState.getResponsiveHeight(20)),
      child: Card(
        color: _appThemeState.whiteColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: _appThemeState.getResponsiveHeight(300),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _fetchIconWidget()),
              _albumData != null ? _getTitle() : _getTitleShimmer()
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
          _albumData?.feed?.title ?? "",
          textAlign: TextAlign.center,
          style: _appThemeState.titleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          Strings.by + _albumData?.feed?.author?.name ?? "",
          textAlign: TextAlign.center,
          style: _appThemeState.subtitleTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          Strings.country + _albumData?.feed?.country ?? "",
          textAlign: TextAlign.center,
          style: _appThemeState.subtitleTextStyle,
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
            height: _appThemeState.getResponsiveHeight(50),
            margin:
                EdgeInsets.only(right: _appThemeState.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
          SizedBox(
            height: _appThemeState.getResponsiveHeight(15),
          ),
          ShimmerWidget(
            width: MediaQuery.of(context).size.width,
            height: _appThemeState.getResponsiveHeight(50),
            margin:
                EdgeInsets.only(right: _appThemeState.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
          SizedBox(
            height: _appThemeState.getResponsiveHeight(15),
          ),
          ShimmerWidget(
            width: MediaQuery.of(context).size.width,
            height: _appThemeState.getResponsiveHeight(50),
            margin:
                EdgeInsets.only(right: _appThemeState.getResponsiveWidth(30)),
            borderRadius: 3.0,
          ),
        ],
      ),
    );
  }

  _getCopyRightsText() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _appThemeState.getResponsiveWidth(100),
      ),
      child: _albumData != null
          ? Text(
              _albumData?.feed?.copyright ?? "",
              style: _appThemeState.copyRightsTextStyle,
              textAlign: TextAlign.center,
            )
          : ShimmerWidget(
              width: MediaQuery.of(context).size.width,
              height: _appThemeState.getResponsiveHeight(50),
              borderRadius: 3.0,
            ),
    );
  }

  _showAlbumDetails(AlbumDetails albumDetails) {
    if (albumDetails != null) {
      return showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (builder) {
            return FractionallySizedBox(
              heightFactor: 0.90,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: AlbumDetailsPage(albumDetails),
              ),
            );
          });
    }
  }

  ///
  /// Fetching album details from server
  ///
  void _fetchAlbumList() {
    ApiInterface.getInstance()
        .getAlbumListRepository()
        .fetchAlbumList()
        .then((albumData) {
      dashBoardBloc.setAlbumData(albumData);
    }).catchError((error) {});
  }

  Widget _fetchIconWidget() {
    return Container(
      width: _appThemeState.getResponsiveWidth(200),
      height: _appThemeState.getResponsiveWidth(200),
      child: _albumData != null && _albumData?.feed?.icon != null
          ? Image.network(
              _albumData?.feed?.icon,
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
      width: _appThemeState.getResponsiveHeight(200),
    );
  }

  Widget _getNoInternetWidget(bool isNotConnected) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 500),
      height: isNotConnected ? _appThemeState.getResponsiveHeight(120):0,
      color: Colors.red,
      child: Center(child: Text(Strings.checkInternetConnection, style: _appThemeState.internetConnectionTextStyle)),
    );
  }
}
