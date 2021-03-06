import 'package:musiclibrary/repository/album_list_repository.dart';

///
/// This class provides all API related repositories
///

class ApiInterface implements ApiInterfaceService {
  static ApiInterface _instance;

  static ApiInterface getInstance() {
    if (_instance == null) {
      _instance = ApiInterface();
    }
    return _instance;
  }

  @override
  AlbumListRepositoryImpl getAlbumListRepository() {
    return AlbumListRepositoryImpl();
  }
}

abstract class ApiInterfaceService {
  AlbumListRepositoryImpl getAlbumListRepository();
}
