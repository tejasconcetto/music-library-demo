import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musiclibrary/models/album_details.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/constants.dart';
import 'package:musiclibrary/ui/common/shimmer_widget.dart';

class CarouselItem extends StatelessWidget {
  final AlbumDetails albumDetails;
  final Function onItemClicked;

  CarouselItem(this.albumDetails, {this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    AppThemeState  _appThemeState = AppTheme.of(context);
    return InkWell(
      onTap: () {
        if (onItemClicked != null) {
          onItemClicked(albumDetails);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _appThemeState.getResponsiveWidth(10),
            vertical: _appThemeState.getResponsiveHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: _fetchArtistThumbnail(context),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  albumDetails?.name ?? "",
                  textAlign: TextAlign.center,
                  style: _appThemeState.albumTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fetchArtistThumbnail(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: albumDetails != null && albumDetails?.artworkUrl100 != null
            ? Image.network(
                fetchHighResolutionImage(albumDetails?.artworkUrl100),
                frameBuilder: (context, widget, frame, isLoaded) {
                  return frame != null ? widget : _getShimmerWidget();
                },
                fit: BoxFit.cover,
              )
            : _getShimmerWidget(),
      ),
    );
  }

  Widget _getShimmerWidget() {
    return ShimmerWidget(
      borderRadius: 10,
    );
  }

  ///
  /// It converts low resolution image into high resolution image
  ///
  String fetchHighResolutionImage(String url) {
    String updatedImageUrl = url;
    if (url.contains(Constants.resolution200)) {
      updatedImageUrl = url.replaceAll(Constants.resolution200, Constants.resolution512);
    }
    albumDetails.artworkUrl100 = updatedImageUrl;
    return updatedImageUrl;
  }
}
