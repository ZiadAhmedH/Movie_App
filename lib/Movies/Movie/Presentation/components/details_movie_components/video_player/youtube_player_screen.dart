import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerScreen({super.key, required this.videoUrl});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;
  late String? videoId;
  bool isValidUrl = true;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    if (videoId == null) {
      setState(() {
        isValidUrl = false;
      });
      debugPrint("Invalid YouTube URL");
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
useHybridComposition: true,
        // Change to true if handling live streams
      ),
    )..addListener(() {
      debugPrint("Current Position: ${_controller.value.position}");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  isValidUrl
          ? YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) {
          return player;

        },
      )
          : const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.exclamationTriangle, color: Colors.red, size: 50),
            Text(
              "Invalid YouTube URL",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ],
        ),
    );
  }
}
