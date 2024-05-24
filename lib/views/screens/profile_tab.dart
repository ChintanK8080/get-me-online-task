import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_strings.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';
import 'package:getme_online_task/views/widgets/profile_card.dart';
import 'package:getme_online_task/views/widgets/stats_card.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).padding.top +
                (Scaffold.of(context).appBarMaxHeight ?? 0) +
                22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.favorite,
                color: AppColors.purple,
                size: 30,
              ),
              SvgPicture.asset(
                AppAssets.settings,
                height: 30,
                width: 30,
              ),
            ],
          ),
          Container(
            height: 85,
            width: 85,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppAssets.profilePicture),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Natalia Lebediva", style: AppTextStyle.sectionTitle),
          const SizedBox(height: 20),
          const ProfileCard(
            session: '13',
            time: '04:23:04',
            title: AppStrings.practices,
            imagePath: AppAssets.book,
            imageBackgroundColor: AppColors.purpleDark,
          ),
          const SizedBox(height: 15),
          const ProfileCard(
            session: '06',
            time: '00:55:04',
            title: AppStrings.meditations,
            imageBackgroundColor: AppColors.pink,
            imagePath: AppAssets.book,
          ),
          const SizedBox(height: 15),
          const StatsCard()
        ],
      ),
    );
  }
}
