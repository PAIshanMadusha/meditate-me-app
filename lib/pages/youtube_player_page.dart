import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/youtube_player_page_data.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final YoutubePlayerPageData youtubePlayerPageData;
  const YoutubePlayerPage({
    super.key,
    required this.youtubePlayerPageData,
  });

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    //Get Video Id From Url
    final videoId = YoutubePlayer.convertUrlToId(
          widget.youtubePlayerPageData.url,
        ) ??
        "";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.youtubePlayerPageData.title,
          style: AppTextStyle.kMainTitleStyle.copyWith(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            AppConstances.kPaddingValue,
          ),
          child: Column(
            children: [
              if (_controller.initialVideoId.isNotEmpty)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    child: YoutubePlayer(controller: _controller),
                  ),
                )
              else
                Text(
                  "No Video Available!",
                  style: AppTextStyle.kBodyStyle,
                ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Text(
                " Category: ${widget.youtubePlayerPageData.category}",
                style: AppTextStyle.kTitleStyle,
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 35,
                    color: AppColors.kBlackColor,
                  ),
                  SizedBox(
                    width: AppConstances.kSizedBoxValue - 5,
                  ),
                  Text(
                    "${widget.youtubePlayerPageData.duration.toString()} Min",
                    style: AppTextStyle.kBodyStyle.copyWith(
                      color: AppColors.kBlackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Text(
                widget.youtubePlayerPageData.description,
                style: AppTextStyle.kSmallDescriptionStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
