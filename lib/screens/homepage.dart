import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? _videoController;
  bool _isVideoLoaded = false;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _handleVideoSelection() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

      if (pickedFile != null) {
        _initializeVideoPlayer(File(pickedFile.path));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No video selected')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission not granted')),
      );
    }
  }

  Future<void> _initializeVideoPlayer(File videoFile) async {
    _videoController?.dispose();

    _videoController = VideoPlayerController.file(videoFile)
      ..addListener(() {
        if (_videoController!.value.hasError) {
          print('Error: ${_videoController!.value.errorDescription}');
        }
      })
      ..initialize().then((_) {
        setState(() {
          _isVideoLoaded = true;
          _videoController!.play();
        });
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
  }

  Widget get _buildUI {
    return Center(
      child: _videoController != null && _videoController!.value.isInitialized
          ? SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              child: AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
            )
          : _isVideoLoaded
              ? const Text('Failed to load video')
              : const Text('No video selected'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI,
      floatingActionButton: FloatingActionButton(
        onPressed: _handleVideoSelection,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
