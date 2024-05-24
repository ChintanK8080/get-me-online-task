import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_strings.dart';

import '../../app_constants/app_text_styles.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 310,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(AppAssets.header2), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text(
                AppStrings.anxiety,
                style: AppTextStyle.heading,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Spacer(),
              SvgPicture.asset(AppAssets.heart)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            AppStrings.description,
            style: AppTextStyle.subHeading,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
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
