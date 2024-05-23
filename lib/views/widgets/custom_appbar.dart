import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/app_constants/app_text_styles.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  Color? color,
  Color? backgroundColor,
}) {
  return AppBar(
    centerTitle: true,
    leading: GestureDetector(
      child: Icon(
        CupertinoIcons.back,
        color: color ?? AppColors.black,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(
      title,
      style: AppTextStyle.appBarTitle.copyWith(color: color),
    ),
    shadowColor: Colors.transparent,
    backgroundColor: backgroundColor ?? AppColors.white,
  );
}
