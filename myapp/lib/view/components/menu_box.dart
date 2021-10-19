import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/user/user_ex.dart';
import 'package:myapp/view/components/button/yes_eating.dart';
import 'package:myapp/view/pages/subpages/rate_menu_page.dart';
import '../../date_functions.dart';
import 'button/not_eating.dart';

class MenuBox extends StatelessWidget {
  final String dateAndTime;
  final Map<String, List<String>> menuMap;
  final List<String> menuList;
  const MenuBox(this.dateAndTime, this.menuList, this.menuMap);
  @override
  Widget build(BuildContext context) {
    bool _isNow = validateNow(dateAndTime);
    String time = getTimeFromDateAndTime(dateAndTime);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: InkWell(
        onTap: () {
          Get.to(
            () => RateMenuPage(
              dateAndTime,
              menuMap,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(2.w),
          height: (0.3).sw * 1.5,
          width: (0.22).sw * 1.5,
          decoration: BoxDecoration(
              color: Colors.white,
              border: _isNow == false
                  ? Border.all(color: Colors.black45, width: 2)
                  : Border.all(color: Colors.lightGreen[600]!, width: 2),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                _isNow == true
                    ? BoxShadow(
                        color: Colors.lightGreen,
                        blurRadius: 5,
                        spreadRadius: 0.01,
                      )
                    : BoxShadow()
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //그 메뉴에 대한 날짜와 시간(조식, 중식, 석식)
              _buildMenuHeader(time),
              Divider(color: Colors.grey),
              // 메뉴
              _buildMenuList(),
              SizedBox(height: 2),
              // 취식, 불취식 표시
              menuList.length == 0
                  ? Container()
                  : _buildCheckIfEating(time)
                      ? YesEating()
                      : NotEating(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuHeader(String time) {
    return Text(
      "${getMonthDayAndWeekdayInKorean(dateAndTime)} $time",
      style: TextStyle(fontSize: 11.sp),
    );
  }

  Widget _buildMenuList() {
    return menuList.length == 0
        ? Center(
            child: Text(
              "등록된 메뉴 정보가 없습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.sp),
            ),
          )
        : Expanded(
            child: ListView(
              children: [
                Column(
                  children: List.generate(
                    menuList.length,
                    (index) => Text(
                      "${menuList[index]}",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: menuList[index] == "오리불고기"
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  bool _buildCheckIfEating(String time) {
    return checkIfEating(dateAndTime, time);
  }
}
