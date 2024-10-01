import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoName;

  YouTubeVideoPlayer({required this.videoName});

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubeExplode _youtubeExplode;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _youtubeExplode = YoutubeExplode();
    _fetchYouTubeVideo();
  }

  Future<void> _fetchYouTubeVideo() async {
    try {
      var searchResults = await _youtubeExplode.search.search(widget.videoName);
      if (searchResults.isNotEmpty) {
        var video = searchResults.first;

        var manifest = await _youtubeExplode.videos.streamsClient.getManifest(video.id);
        var streamInfo = manifest.muxed.withHighestBitrate(); // Highest quality stream

        _videoPlayerController = VideoPlayerController.networkUrl(streamInfo.url);
        await _videoPlayerController!.initialize();

        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          autoPlay: true,
          looping: false,
        );

        setState(() {
          _isLoading = false;
        });
      } else {
        print("No video found with the name: ${widget.videoName}");
      }
    } catch (e) {
      print('Error fetching video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _youtubeExplode.close(); // Close the YouTube client
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.videoName, style: TextStyle(color: Colors.white)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Chewie(controller: _chewieController!),
    );
  }
}
