import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';
import 'package:getme_online_task/views/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: "Mental Training",
          color: AppColors.white,
          backgroundColor: AppColors.purpleDark),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.musicPlayerBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                AppAssets.heart,
                height: 24,
                width: 24,
              ),
              SvgPicture.asset(
                AppAssets.pauseButton,
                height: 44,
                width: 44,
              ),
              SvgPicture.asset(
                AppAssets.filter,
                height: 24,
                width: 24,
              ),
            ],
          ),
          Slider(
            value: 2,
            activeColor: AppColors.white,
            onChanged: (v) {},
            min: 00,
            max: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "00:00",
                  style: AppTextStyle.subHeading2,
                ),
                Text(
                  "00:00",
                  style: AppTextStyle.subHeading2,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
