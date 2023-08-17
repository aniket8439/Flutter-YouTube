import 'package:dio/dio.dart';

class ApiClient {
  Dio _dio = Dio();
  Future<dynamic> getVideos() async {
    const URL =
        'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=100&regionCode=IN&key=AIzaSyAbjnlxt2oiQOfIjWd251USWLWO0Qa4pgo';
    final Response response = await _dio.get(URL);
    return response.data['items'];
  }
}