import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/view/pages/subpages/inner_setting_page.dart';

import '../subpages/app_info_page.dart';
import '../subpages/user_info_page.dart';

class SettingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        ConfigItem(
            icon: Icons.account_circle,
            text: "회원정보",
            tap: () {
              Get.to(() => UserInfoPage());
            }),
        ConfigItem(
            icon: Icons.info,
            text: "앱정보",
            tap: () {
              Get.to(() => AppInfoPage());
            }),
        ConfigItem(
            icon: CupertinoIcons.gear_alt_fill,
            text: "설정내부 확인",
            tap: () {
              Get.to(() => InnerSettingPage());
            }),
      ],
    );
  }
}

class ConfigItem extends StatelessWidget {
  IconData icon;
  String text;
  final tap;
  ConfigItem({required this.icon, required this.text, required this.tap});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.r),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
