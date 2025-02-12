import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/youtube_player_page_data.dart';

class YoutubePlayerPage extends StatelessWidget {
  final YoutubePlayerPageData youtubePlayerPageData;
  const YoutubePlayerPage({
    super.key,
    required this.youtubePlayerPageData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
