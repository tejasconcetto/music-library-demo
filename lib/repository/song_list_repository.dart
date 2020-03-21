import 'package:musiclibrary/models/song_data.dart';
import 'package:musiclibrary/sevices/song_list_service.dart';

class SongListRepositoryImpl extends SongListRepository{

  SongListService _songListService = SongListService();

  @override
  Future<SongData> fetchSongList() async{
    return await _songListService.getSongList();
  }
}

abstract class SongListRepository{
  Future<SongData> fetchSongList();
}