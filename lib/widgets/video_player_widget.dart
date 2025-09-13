import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  
  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath);
    await _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(0); // Mute
    _videoPlayerController.play();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF0066CC).withOpacity(0.1),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF0066CC),
          ),
        ),
      );
    }
    
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: VideoPlayer(_videoPlayerController),
    );
  }
}