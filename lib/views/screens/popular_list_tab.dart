import 'package:flutter/material.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/views/widgets/custom_appbar.dart';
import 'package:getme_online_task/views/widgets/vertical_list_tile.dart';

class PopularListPage extends StatefulWidget {
  const PopularListPage({super.key});

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Popular", context: context),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => VerticalListTile(),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 20),
          child: Divider(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
