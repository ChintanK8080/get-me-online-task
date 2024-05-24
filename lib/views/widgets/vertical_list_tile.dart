import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';

class VerticalListTile extends StatelessWidget {
  const VerticalListTile({super.key, required this.onClick});
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: onClick,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 64,
              width: 91,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppAssets.verticalTileBackground),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The Cure for Boredom",
                  style: AppTextStyle.tileSubTitle,
                ),
                SizedBox(
                  height: 6,
                ),
                Text("7 min 11 sec"),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(AppAssets.heart)
          ]),
        ),
      ),
    );
  }
}
