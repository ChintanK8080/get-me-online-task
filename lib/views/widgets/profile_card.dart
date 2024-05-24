import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.session,
      required this.time,
      required this.title,
      required this.imagePath,
      required this.imageBackgroundColor});
  final String session;
  final String time;
  final String title;
  final String imagePath;
  final Color imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: AppColors.greyLight, borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: imageBackgroundColor),
                  child: SvgPicture.asset(
                    imagePath,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: AppTextStyle.sectionTitle,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "sessions",
                  style: AppTextStyle.subHeading.copyWith(
                    color: AppColors.black.withOpacity(0.4),
                  ),
                ),
                Text(
                  session,
                  style: AppTextStyle.heading.copyWith(color: AppColors.black),
                ),
                const SizedBox(),
                Text(
                  "Time",
                  style: AppTextStyle.subHeading.copyWith(
                    color: AppColors.black.withOpacity(0.4),
                  ),
                ),
                Text(
                  time,
                  style: AppTextStyle.heading.copyWith(color: AppColors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
