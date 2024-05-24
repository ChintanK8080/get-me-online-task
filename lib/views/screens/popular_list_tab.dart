import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/views/screens/music_player.dart';
import 'package:getme_online_task/views/widgets/custom_appbar.dart';
import 'package:getme_online_task/views/widgets/vertical_list_tile.dart';

class PopularListPage extends StatefulWidget {
  const PopularListPage({super.key});

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  AudioPlayer player = AudioPlayer();

  Future<void> initializePlayer() async {
    player.setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await player.setSource(AssetSource('dummy_music.mp3'));
        await player.resume();
      },
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Popular", context: context),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => VerticalListTile(
          onClick: () async {
            player = AudioPlayer();
            player.setReleaseMode(ReleaseMode.stop);
            await player.setSource(AssetSource('audio/dummy_audio.mp3'));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MusicPlayerPage(audioPlayer: player),
            ));
          },
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Divider(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
