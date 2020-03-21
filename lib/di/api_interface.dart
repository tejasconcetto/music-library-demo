import 'package:musiclibrary/repository/song_list_repository.dart';

class ApiInterface implements ApiInterfaceService{

  static ApiInterface _instance;

  static ApiInterface getInstance(){
    if(_instance == null){
      _instance = ApiInterface();
    }
    return _instance;
  }

  @override
  SongListRepositoryImpl getSongListRepository() {
    return SongListRepositoryImpl();
  }
}

abstract class ApiInterfaceService {

  SongListRepositoryImpl getSongListRepository();
}