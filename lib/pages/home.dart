import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:youtube/pages/player.dart';
import 'package:youtube/services/api-client.dart';
import 'package:timeago/timeago.dart' as timeago;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiClient.getVideos(),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapShot) {
          if (!snapShot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapShot.hasError) {
            return const Center(child: Text('Something went wrong...'));
          } else {
            return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (c, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) =>
                              Player(snapShot.data[index]['id'])));
                    },
                    child: Column(
                      children: [
                        Image.network(snapShot.data[index]['snippet']
                            ['thumbnails']['standard']['url']),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/256/147/147142.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              snapShot.data[index]['snippet']['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50),
                            const Text('Views: '),
                            Text(Numeral(int.parse(snapShot.data[index]
                                    ['statistics']['viewCount']))
                                .format()),
                            const Text('  | Likes : '),
                            Text(Numeral(int.parse(snapShot.data[index]
                                    ['statistics']['likeCount']))
                                .format()),
                            const Text(' | '),
                            Text(timeago.format(DateTime.parse(snapShot
                                .data[index]['snippet']['publishedAt'])))
                          ],
                        )
                      ],
                    ),
                  );
                });
          }
        });
  }
}
