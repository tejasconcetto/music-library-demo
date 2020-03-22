import 'dart:async';

import 'package:musiclibrary/models/album_data.dart';

import '../common/bloc_provider.dart';

class DashBoardBloc extends BlocBase {
  AlbumData _albumData;

  AlbumData get albumData => _albumData;

  final _fetchAlbumDataStreamController = StreamController<AlbumData>();

  Stream<AlbumData> get fetchAlbumDataStreamController =>
      _fetchAlbumDataStreamController.stream;

  ///
  /// method to set album data
  ///
  void setAlbumData(AlbumData albumData) {
    _albumData = albumData;
    _fetchAlbumDataStreamController.sink.add(albumData);
  }

  @override
  void dispose() {
    _fetchAlbumDataStreamController
        .close(); // dispose stream when UI is disposed
    super.dispose();
  }
}
