// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_strings.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';

enum Week { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.stats,
                  style: AppTextStyle.sectionTitle,
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.lastWeek,
                      style: AppTextStyle.subHeading2
                          .copyWith(color: AppColors.black),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.purpleDark,
                            shape: BoxShape.circle,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.sessions,
                          style: AppTextStyle.subHeading.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.pink,
                            shape: BoxShape.circle,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.meditations,
                          style: AppTextStyle.subHeading.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 27),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          size: 15,
                          Icons.watch_later_outlined,
                          color: AppColors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "04:43:05",
                          style: AppTextStyle.subHeading.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          size: 15,
                          Icons.watch_later_outlined,
                          color: AppColors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "00:15:45",
                          style: AppTextStyle.subHeading.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            WeekView(
              listOfWeekData: [
                WeekData(session: 0.1, meditations: 0.5),
                WeekData(session: 0.3, meditations: 1),
                WeekData(session: 0.8, meditations: 1),
                WeekData(session: 1, meditations: 0.3),
                WeekData(session: 0.1, meditations: 0.4),
                WeekData(session: 0.1, meditations: 0.3),
                WeekData(session: 0.4, meditations: 0.8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeekView extends StatelessWidget {
  const WeekView({super.key, required this.listOfWeekData});
  final List<WeekData> listOfWeekData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (int i = 0; i < Week.values.length; i++) ...[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 50 * listOfWeekData[i].meditations,
                    width: 6,
                    color: AppColors.pink,
                  ),
                  Container(
                    height: 50 * listOfWeekData[i].session,
                    width: 6,
                    color: AppColors.purpleDark,
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                Week.values[i].name,
                style: AppTextStyle.subHeading2
                    .copyWith(color: AppColors.black.withOpacity(0.5)),
              )
            ],
          ),
        ]
      ],
    );
  }
}

class WeekData {
  double session;
  double meditations;
  WeekData({
    required this.session,
    required this.meditations,
  });
}
