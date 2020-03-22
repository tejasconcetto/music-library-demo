import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musiclibrary/models/album_data.dart';
import 'package:musiclibrary/ui/common/api_client.dart';

import '../ui/common/strings.dart';

///
/// This class fetches album related details from server
///
class AlbumListService extends ApiClient {
  Future<AlbumData> getAlbumList() async {
    final response = await http.get(albumListUrl);
    if (response.statusCode == successResponse) {
      return AlbumData.fromJson(json.decode(response.body));
    } else {
      throw Exception(Strings.failedToFetchAlbum);
    }
  }
}
