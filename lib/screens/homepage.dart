import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../utils.dart';
import 'package:firebase_core/firebase_core.dart';
import '../resources/save_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _videoURL;
  late VideoPlayerController _controller;
  bool _isPlaying = false; // to track play/pause state of preeview of video
  String? _downloadURL;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Upload'),
      ),
      body: Center(
        child: _videoURL != null
            ? _videoPreviewWidget()
            : const Text("No Video SElected"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child: const Icon(
          Icons.upload,
          color: Colors.black,
        ),
      ),
    );
  }

  void _pickVideo() async {
    _videoURL = await pickVideo();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.file(File(_videoURL!))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _isPlaying = true;
      });
  }

  // to toggle play /pause for the video
  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause(); // Pause video if it's playing
      } else {
        _controller.play(); // Play video if it's paused
      }
      _isPlaying = _controller.value.isPlaying; // Update play state
    });
  }

  // Method to handle video seeking
  void _onSeek(double value) {
    final duration = _controller.value.duration;
    final newPosition = duration * value;
    _controller.seekTo(newPosition); // Seek video to the selected position
  }

  Widget _videoPreviewWidget() {
    if (_controller != null && _controller.value.isInitialized) {
      return Column(
        children: [
          Stack(
            alignment:
                Alignment.center, // Align the play/pause button at the center
            children: [
              SizedBox(
                width: 300,
                height: 533.33,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
              IconButton(
                iconSize: 64.0, // Adjust size of play/pause button
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white
                      .withOpacity(0.8), // Button is semi-transparent
                ),
                onPressed: _togglePlayPause, // Toggle play/pause on press
              ),
            ],
          ),
          const SizedBox(height: 20), // Space between video and slider

          // Slider for seeking
          // Slider(
          //   value: _controller.value.position.inSeconds.toDouble(),
          //   min: 0,
          //   max: _controller.value.duration.inSeconds.toDouble(),
          //   onChanged: (value) {
          //     _onSeek(value / _controller.value.duration.inSeconds.toDouble());
          //   },
          // ),

          ElevatedButton(
            onPressed: _uploadVideo,
            child: const Text("Start generating"),
          ),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  void _uploadVideo() async {
    _downloadURL = await StoreData().uploadVideo(_videoURL!);
    await StoreData().saveVideoData(_downloadURL!);
    setState(() {
      _videoURL = null;
    });
  }
}
