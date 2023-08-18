import 'package:dio/dio.dart';

class ApiClient {
  Dio _dio = Dio();
  Future<dynamic> getVideos() async {
    const URL =  //Add your API_KEY after below link
        'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=100&regionCode=IN&key=';
    final Response response = await _dio.get(URL);
    return response.data['items'];
  }
}
