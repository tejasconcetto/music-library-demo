import 'dart:convert';

import 'package:musiclibrary/models/album_data.dart';
import 'package:musiclibrary/ui/common/api_client.dart';
import 'package:http/http.dart' as http;

import '../ui/common/strings.dart';
class AlbumListService extends ApiClient{

  Future<AlbumData> getAlbumList() async{
    final response = await http.get(albumListUrl);
    if (response.statusCode == 200) {
      return AlbumData.fromJson(json.decode(response.body));
    } else {
      throw Exception(Strings.failedToFetchAlbum);
    }
  }

}