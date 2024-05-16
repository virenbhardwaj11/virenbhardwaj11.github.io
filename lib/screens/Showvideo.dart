import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class Showvideo extends StatefulWidget {
  final String url;
  const Showvideo({super.key, required this.url});

  @override
  State<Showvideo> createState() => _ShowvideoState();
}

class _ShowvideoState extends State<Showvideo> {
  late FlickManager flickManager;
  Future<void> initializePlayer() async {}
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse(widget.url),
    ));
  }
  @override
  void dispose() async {
    super.dispose();
    flickManager.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (pop){
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      },
      child: Scaffold(
        body: ResponsiveBuilder(builder: (context,size){
          if(size.deviceScreenType == DeviceScreenType.mobile){
            return Center(
              child: FlickVideoPlayer(
                preferredDeviceOrientation: const [DeviceOrientation.landscapeLeft],
                  flickManager: flickManager
              ),
            );
          } if(size.deviceScreenType == DeviceScreenType.tablet){
            return Center(
              child: FlickVideoPlayer(
                preferredDeviceOrientation: const [DeviceOrientation.landscapeLeft],
                  flickManager: flickManager
              ),
            );
          }
          return Center(
            child: FlickVideoPlayer(
                flickManager: flickManager
            ),
          );
        })
      ),
    );
  }
}
