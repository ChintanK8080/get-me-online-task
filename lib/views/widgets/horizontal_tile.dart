import 'package:flutter/material.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_strings.dart';

import '../../app_constants/app_text_styles.dart';

class HorizontalTile extends StatelessWidget {
  const HorizontalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 293,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(AppAssets.tileBackground), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                AppStrings.anxiety,
                style: AppTextStyle.heading,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                AppStrings.description,
                style: AppTextStyle.subHeading,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "7steps | 5-11min",
                style: AppTextStyle.subHeading2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
      ),
    );
  }
}
