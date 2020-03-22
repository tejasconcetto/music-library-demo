import 'package:musiclibrary/models/album_data.dart';
import 'package:musiclibrary/sevices/album_list_service.dart';

///
/// this class provides Album repository which manages all album related API calls
///
class AlbumListRepositoryImpl extends AlbumListRepository {
  AlbumListService _albumListService = AlbumListService();

  @override
  Future<AlbumData> fetchAlbumList() async {
    return await _albumListService.getAlbumList();
  }
}

abstract class AlbumListRepository {
  Future<AlbumData> fetchAlbumList();
}
