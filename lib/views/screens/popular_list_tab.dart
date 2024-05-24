import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_strings.dart';
import 'package:getme_online_task/model/audio_data_model.dart';
import 'package:getme_online_task/utilities/utilities.dart';
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
  List<AudioData> audioDataList = [];
  bool isLoading = false;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> getAllAudios() async {
    if (!(await Utilty.checkInternetConnection())) {
      FlutterToastr.show(AppStrings.noInternetConnection, context);
      return;
    }
    isLoading = true;
    _notify();
    List<AudioData> tempAudioDataList = [];
    try {
      CollectionReference userDataRef =
          FirebaseFirestore.instance.collection('audios');
      QuerySnapshot querySnapshot = await userDataRef.get();
      for (var doc in querySnapshot.docs) {
        final audioData =
            AudioData.fromJson(doc.data() as Map<String, dynamic>);
        tempAudioDataList.add(audioData);
      }
      audioDataList = tempAudioDataList;
    } catch (e) {
      print('Error getting audio data: $e');
    }
    isLoading = false;
    _notify();
  }

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getAllAudios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Popular", context: context),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.purpleDark),
            )
          : (audioDataList.isEmpty)
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: audioDataList.length,
                  itemBuilder: (context, index) => VerticalListTile(
                    audioName: audioDataList[index].audioName,
                    audioDuration: audioDataList[index].audioDuration,
                    onClick: () async {
                      player = AudioPlayer();
                      player.setReleaseMode(ReleaseMode.stop);
                      await player.setSource(AssetSource(AppAssets.tempAudio));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MusicPlayerPage(audioPlayer: player),
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
