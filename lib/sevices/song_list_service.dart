import 'dart:convert';

import 'package:flutterprojectsetup/models/song_data.dart';
import 'package:flutterprojectsetup/ui/common/api_client.dart';
import 'package:http/http.dart' as http;
class SongListService extends ApiClient{

  Future<SongData> getSongList() async{
    final response = await http.get(songListUrl);
    if (response.statusCode == 200) {
      return SongData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch songs');
    }
  }

}