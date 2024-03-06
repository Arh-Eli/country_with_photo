import 'package:flutter/material.dart';
import 'package:countriesv2/components/countryData.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final PageController controller = PageController();


final _controller = YoutubePlayerController.fromVideoId(
  videoId: 'https://youtu.be/x22TJMv2RYo?si=6865oDbKM72yPWHc',
  autoPlay: false,
  params: const YoutubePlayerParams(showFullscreenButton: true),
);



class CountryPage extends StatelessWidget {
  const CountryPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(countries[id].name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Image.network(countries[id].flag),
          const Text('Описание:'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 624,maxHeight: 200),
            child:
                Container(
                  padding: const EdgeInsets.all(1),
                  color: Colors.grey,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.white,
                    child: ListView(
                    children: [
                      Text(countries[id].info)
              ],
            ),
                )
                ),
          ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 624,maxHeight: 200),
              child: PageView(
                controller: controller,
                children: countries[id].GetListOfPhoto(),
              ),
            ),
      YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
        ],
      ),
    );
  }
}