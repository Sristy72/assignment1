import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController youtubeController;

  final String videoUrl = 'https://www.youtube.com/watch?v=HgiiY9TLtX8'; // Replace with actual video URL

  @override
  void onInit() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
    youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.onInit();
  }

  @override
  void onClose() {
    youtubeController.dispose();
    super.onClose();
  }
}

