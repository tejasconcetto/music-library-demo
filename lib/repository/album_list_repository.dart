import 'package:musiclibrary/models/album_data.dart';
import 'package:musiclibrary/sevices/album_list_service.dart';

class AlbumListRepositoryImpl extends AlbumListRepository{

  AlbumListService _albumListService = AlbumListService();

  @override
  Future<AlbumData> fetchAlbumList() async{
    return await _albumListService.getAlbumList();
  }
}

abstract class AlbumListRepository{
  Future<AlbumData> fetchAlbumList();
}