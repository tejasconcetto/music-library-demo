import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/models/song_details.dart';
import 'package:flutterprojectsetup/ui/common/app_theme.dart';
import 'package:flutterprojectsetup/ui/common/bloc_provider.dart';
import 'package:flutterprojectsetup/ui/common/shimmer_widget.dart';
import 'package:flutterprojectsetup/ui/common/strings.dart';
import 'package:intl/intl.dart';

class SongDetailsPage extends StatelessWidget {
  final SongDetails _songDetails;

  SongDetailsPage(this._songDetails);

  @override
  Widget build(BuildContext context) {
    AppTheme _appTheme = BlocProvider.of(context).bloc;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _appTheme.getResponsiveWidth(50),
          vertical: _appTheme.getResponsiveHeight(50)),
      child: Column(
        children: <Widget>[
          _getNameForSong(_appTheme),
          SizedBox(
            height: _appTheme.getResponsiveHeight(50),
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
            height: _appTheme.getResponsiveHeight(30),
          ),
          _getArtistName(_appTheme),
          SizedBox(
            height: _appTheme.getResponsiveHeight(15),
          ),
          _getReleasedDate(_appTheme),
          SizedBox(
            height: _appTheme.getResponsiveHeight(15),
          ),
          _getGenresList(_appTheme),
          _getCopyRightText(_appTheme),
          _closeButton(_appTheme,context),
        ],
      ),
    );
  }

  Widget _getArtistImage() {
    return _songDetails != null && _songDetails?.artworkUrl100 != null
        ? Image.network(
            _songDetails?.artworkUrl100,
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

  Widget _getNameForSong(AppTheme _appTheme) {
    return Text(
      _songDetails?.name ?? "",
      style: _appTheme.songDetailTitleTextStyle,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  _getArtistName(AppTheme _appTheme) {
    return Text(
      _songDetails.artistName + Strings.artist,
      style: _appTheme.artistTextStyle,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  _getReleasedDate(AppTheme _appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Strings.releasedOn,
          style: _appTheme.releasedLabelTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        Text(
          _convertDate(_songDetails?.releaseDate) + " ("+_songDetails?.kind+")" ?? "",
          style: _appTheme.releaseTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ],
    );
  }

  _getGenresList(AppTheme _appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Strings.genres,
          style: _appTheme.releasedLabelTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        Flexible(
          child: Text(
            _getGenres(),
            style: _appTheme.releaseTextStyle,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  String _getGenres() {
    if (_songDetails.genres != null && _songDetails.genres.length > 0) {
      List<String> genres = List();
      _songDetails.genres.forEach((genre) {
        genres.add(genre?.name ?? "");
      });
      return genres.join(" / ");
    } else {
      return "-";
    }
  }

  Widget _getCopyRightText(AppTheme _appTheme) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            _songDetails?.copyright ?? "",
            style: _appTheme.copyRightsTextStyle,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }

  String _convertDate(String releaseDate) {
    return DateFormat("dd MMM yyyy").format(DateTime.parse(releaseDate));
  }

  Widget _closeButton(AppTheme _appTheme,BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 12.0),
        width: _appTheme.getResponsiveWidth(200),
        height: _appTheme.getResponsiveHeight(150),
        child: Text(
          Strings.close,
          style: _appTheme.closeTextStyle,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
