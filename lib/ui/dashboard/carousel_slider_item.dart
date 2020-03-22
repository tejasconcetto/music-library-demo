import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musiclibrary/models/song_details.dart';
import 'package:musiclibrary/ui/common/app_theme.dart';
import 'package:musiclibrary/ui/common/bloc_provider.dart';
import 'package:musiclibrary/ui/common/shimmer_widget.dart';

class CarouselItem extends StatelessWidget {
  final SongDetails songDetails;
  final Function onItemClicked;

  CarouselItem(this.songDetails, {this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    AppTheme _appTheme = BlocProvider.of(context).bloc;
    return InkWell(
      onTap: () {
        if (onItemClicked != null) {
          onItemClicked(songDetails);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _appTheme.getResponsiveWidth(10),
            vertical: _appTheme.getResponsiveHeight(20)),
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
                  songDetails?.name ?? "",
                  textAlign: TextAlign.center,
                  style: _appTheme.songTextStyle,
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
        child: songDetails != null && songDetails?.artworkUrl100 != null
            ? Image.network(
                fetchBigImage(songDetails?.artworkUrl100),
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

  String fetchBigImage(String url) {
    String updatedImageUrl = url;
    if (url.contains("200x200")) {
      updatedImageUrl = url.replaceAll("200x200", "512x512");
    }
    songDetails.artworkUrl100 = updatedImageUrl;
    return updatedImageUrl;
  }
}
