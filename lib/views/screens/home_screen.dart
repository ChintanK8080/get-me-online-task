import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getme_online_task/app_constants/app_assets.dart';
import 'package:getme_online_task/app_constants/app_colors.dart';
import 'package:getme_online_task/views/screens/home_tab.dart';
import 'package:getme_online_task/views/screens/practices_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(
          controller: tabController,
          children: [
            HomeTab(),
            PracticesTab(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: TabBar(
          controller: tabController,
          tabs: [
            SvgPicture.asset(
              AppAssets.home,
              colorFilter: ColorFilter.mode(
                  (tabController?.index == 0)
                      ? AppColors.purple
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
            SvgPicture.asset(
              AppAssets.book,
              colorFilter: ColorFilter.mode(
                  (tabController?.index == 1)
                      ? AppColors.purple
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
            SvgPicture.asset(
              AppAssets.flower,
              colorFilter: ColorFilter.mode(
                  (tabController?.index == 2)
                      ? AppColors.purple
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
            SvgPicture.asset(
              AppAssets.person,
              colorFilter: ColorFilter.mode(
                  (tabController?.index == 3)
                      ? AppColors.purple
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
