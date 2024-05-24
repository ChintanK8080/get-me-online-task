import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';
import 'package:getme_online_task/views/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;
  bool get _isPaused => _playerState == PlayerState.paused;
  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';
  AudioPlayer get player => widget.audioPlayer;

  @override
  void initState() {
    super.initState();
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: "Mental Training",
          color: AppColors.white,
          backgroundColor: AppColors.purpleDark),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.musicPlayerBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AppAssets.heart,
                  height: 24,
                  width: 24,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_isPaused) {
                      await _play();
                    } else {
                      await _pause();
                    }
                  },
                  child: (_isPaused)
                      ? Image.asset(
                          AppAssets.playButton,
                          height: 44,
                          width: 44,
                        )
                      : SvgPicture.asset(
                          AppAssets.pauseButton,
                          height: 44,
                          width: 44,
                        ),
                ),
                SvgPicture.asset(
                  AppAssets.filter,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
            Slider(
              onChanged: (value) {
                final duration = _duration;
                if (duration == null) {
                  return;
                }

                final position = value * duration.inMilliseconds;
                player.seek(Duration(milliseconds: position.round()));
              },
              activeColor: AppColors.white,
              value: (_position != null &&
                      _duration != null &&
                      _position!.inMilliseconds > 0 &&
                      _position!.inMilliseconds < _duration!.inMilliseconds)
                  ? _position!.inMilliseconds / _duration!.inMilliseconds
                  : 0.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _position != null
                        ? _positionText
                        : _duration != null
                            ? _durationText
                            : '',
                    style: AppTextStyle.subHeading2,
                  ),
                  Text(
                    _duration != null ? _durationText : '00:00',
                    style: AppTextStyle.subHeading2,
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }
}
