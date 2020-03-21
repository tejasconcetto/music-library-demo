import 'package:flutterprojectsetup/models/song_data.dart';
import 'package:flutterprojectsetup/sevices/song_list_service.dart';

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