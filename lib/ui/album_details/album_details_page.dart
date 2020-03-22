import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musiclibrary/models/album_details.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/constants.dart';
import 'package:musiclibrary/ui/common/shimmer_widget.dart';
import 'package:musiclibrary/ui/common/strings.dart';
import 'package:intl/intl.dart';

class AlbumDetailsPage extends StatelessWidget {
  final AlbumDetails _albumDetails;

  AlbumDetailsPage(this._albumDetails);

  @override
  Widget build(BuildContext context) {
    AppThemeState  _appThemeState = AppTheme.of(context);
    return Stack(
      children: <Widget>[
        _closeButton(_appThemeState, context),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: _appThemeState.getResponsiveWidth(100),
              vertical: _appThemeState.getResponsiveHeight(200)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getAlbumDetails(_appThemeState, context),
              _getCopyRightText(_appThemeState),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getArtistImage() {
    return _albumDetails != null && _albumDetails?.artworkUrl100 != null
        ? Image.network(
            _albumDetails?.artworkUrl100,
            frameBuilder: (context, widget, frame, isLoaded) {
              return frame != null ? widget : _getShimmerWidget();
            },
            fit: BoxFit.fill,
          )
        : _getShimmerWidget();
  }

  Widget _getShimmerWidget() {
    return ShimmerWidget(
      borderRadius: 10,
    );
  }

  Widget _getNameForAlbum(AppThemeState _appThemeState) {
    return Text(
      _albumDetails?.name ?? "",
      style: _appThemeState.albumDetailTitleTextStyle,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  _getArtistName(AppThemeState _appThemeState) {
    return Text(
      (_albumDetails?.artistName ?? "") + Strings.artist,
      style: _appThemeState.artistTextStyle,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  _getReleasedDate(AppThemeState _appThemeState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Strings.releasedOn,
          style: _appThemeState.releasedLabelTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        Text(
          _convertDate(_albumDetails?.releaseDate) +
                  " (" +
                  _albumDetails?.kind +
                  ")" ??
              "",
          style: _appThemeState.releaseTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ],
    );
  }

  _getGenresList(AppThemeState _appThemeState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Strings.genres,
          style: _appThemeState.releasedLabelTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        Flexible(
          child: Text(
            _getGenres(),
            style: _appThemeState.releaseTextStyle,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  String _getGenres() {
    if (_albumDetails.genres != null && _albumDetails.genres.length > 0) {
      List<String> genres = List();
      _albumDetails.genres.forEach((genre) {
        genres.add(genre?.name ?? "");
      });
      return genres.join(" / ");
    } else {
      return "-";
    }
  }

  Widget _getCopyRightText(AppThemeState _appThemeState) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          _albumDetails?.copyright ?? "",
          style: _appThemeState.copyRightsTextStyle,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  String _convertDate(String releaseDate) {
    return DateFormat(Constants.DMYFormat).format(DateTime.parse(releaseDate));
  }

  Widget _closeButton(AppThemeState _appThemeState, BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(top: _appThemeState.getResponsiveHeight(60),right: _appThemeState.getResponsiveWidth(40)),
          width: _appThemeState.getResponsiveWidth(100),
          height: _appThemeState.getResponsiveHeight(100),
          child: Icon(
            Icons.close,
            color: Colors.grey,
            size: _appThemeState.getResponsiveWidth(100),
          ),
        ),
      ),
    );
  }

  Widget _getAlbumDetails(AppThemeState _appThemeState, BuildContext context) {
    return Column(
      children: <Widget>[
        _getNameForAlbum(_appThemeState),
        SizedBox(
          height: _appThemeState.getResponsiveHeight(50),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: AspectRatio(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: _getArtistImage(),
            ),
            aspectRatio: 1 / 1,
          ),
        ),
        SizedBox(
          height: _appThemeState.getResponsiveHeight(30),
        ),
        _getArtistName(_appThemeState),
        SizedBox(
          height: _appThemeState.getResponsiveHeight(15),
        ),
        _getReleasedDate(_appThemeState),
        SizedBox(
          height: _appThemeState.getResponsiveHeight(15),
        ),
        _getGenresList(_appThemeState),
      ],
    );
  }
}
