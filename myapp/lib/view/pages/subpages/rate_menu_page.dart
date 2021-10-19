import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/date_functions.dart';
import 'package:myapp/page_util/Info.dart';
import 'package:myapp/user/user_ex.dart';
import 'package:myapp/view/components/appBar/sub_page_appbar.dart';
import 'package:myapp/view/components/button/back_button.dart';
import 'package:myapp/view/components/custom_drawer.dart';
import 'package:myapp/view/components/nutrition_box.dart';
import 'package:myapp/view/components/total_nutrtion_box.dart';
import 'package:myapp/view/pages/subpages/write_suggestion_page.dart';

class RateMenuPage extends StatefulWidget {
  final String dateAndTime;
  final Map<String, List<String>> menuMap;
  const RateMenuPage(
    this.dateAndTime,
    this.menuMap, {
    Key? key,
  }) : super(key: key);
  @override
  _RateMenuPageState createState() => _RateMenuPageState(dateAndTime);
}

class _RateMenuPageState extends State<RateMenuPage> {
  String dateAndTime;
  String? beforeDateAndTime,
      beforeTime,
      afterDateAndTime,
      afterTime; // 어제, 내일 날짜
  int? index;
  bool isLeft = false, isRight = false;
  bool? isEating;
  bool isSave = false;
  late double initialRate;
  late double rate;
  late String time;
  late List<String> menuList;
  _RateMenuPageState(this.dateAndTime);

  @override
  void initState() {
    initialRate = 0;
    rate = initialRate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    rate = 0;
    time = getTimeFromDateAndTime(dateAndTime);
    List<String> menuKeys = widget.menuMap.keys.toList();
    isEating = checkIfEating(dateAndTime, time);
    index = menuKeys.indexOf(dateAndTime);
    menuList = widget.menuMap[dateAndTime] ?? [];
    if (index != 0) {
      isLeft = true;
      beforeDateAndTime = menuKeys[index! - 1];
    }
    if (index != menuKeys.length - 1) {
      isRight = true;
      afterDateAndTime = menuKeys[index! + 1];
    }
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: subPageAppBar("8전투비행단"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _arrowAndDate(), // < 날짜(석식) 취식여부 >
            _nutritionInfo(menuList),
            _menuLists(),
            _saveRating(),
            _notEatingApplyButton(),
            _suggestingButton(),
          ],
        ),
      ),
    );
  }

  Widget _arrowAndDate() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (isLeft == true) {
                setState(() {
                  isLeft = isRight = false;
                  dateAndTime = beforeDateAndTime!;
                });
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: isLeft ? Colors.grey[800] : Colors.grey[500],
            ),
          ),
          Spacer(),
          Center(
              child:
                  Text("${getMonthDayAndWeekdayInKorean(dateAndTime)} $time")),
          Spacer(),
          IconButton(
            onPressed: () {
              if (isRight == true) {
                setState(() {
                  isLeft = isRight = false;
                  dateAndTime = afterDateAndTime!;
                });
              }
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: isRight ? Colors.grey[800] : Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nutritionInfo(List<String> menuList) {
    int calories = 0,
        carbohydrate = 0,
        protein = 0,
        fat = 0,
        salt = 0,
        cholesterol = 0;
    for (String menuName in menuList) {
      Map<String, dynamic> nutrition = menusAndNutrition[menuName] ?? {};
      int? cal = nutrition["칼로리"],
          car = nutrition["탄수화물"],
          pro = nutrition["단백질"],
          fa = nutrition["지방"],
          sal = nutrition["나트륨"],
          chol = nutrition["콜레스테롤"];
      calories += cal ?? 0;
      carbohydrate += car ?? 0;
      protein += pro ?? 0;
      fat += fa ?? 0;
      salt += sal ?? 0;
      cholesterol += chol ?? 0;
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(8.0.r),
        title: Row(
          children: [
            Spacer(),
            Text(
              "-Kcal",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.sp,
              ),
            ),
            Container(
              height: 14,
              child: VerticalDivider(
                color: Colors.black54,
              ),
            ),
            Text(
              "한끼 영양량",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
        children: [
          TotalNutritionBox(
            calories: calories,
            salt: salt,
            cholesterol: cholesterol,
            fat: fat,
            protein: protein,
            carbohydrate: carbohydrate,
          ),
        ],
      ),
    );
  }

  Widget _menuLists() {
    return Expanded(
      child: ListView(
        children: List.generate(
          menuList.length,
          (index) {
            return Column(
              children: [
                _menuTitle(menuList, index),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _menuTitle(List<String> menu, int index) {
    String name = menu[index];
    Map<String, dynamic> nutrition = menusAndNutrition[name] ?? {};
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(8.0.r),
        initiallyExpanded: false,
        title: Text(
          menu[index],
          style: TextStyle(fontSize: 13.sp),
        ),
        children: [
          NutritionBox(
            calories: nutrition["칼로리"],
            carbohydrate: nutrition["탄수화물"],
            protein: nutrition["단백질"],
            fat: nutrition["지방"],
            cholesterol: nutrition["콜레스테롤"] ?? 0,
            salt: nutrition["나트륨"],
          ),
        ],
      ),
    );
  }

  Widget _saveRating() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "오늘 식사는 어떠셨나요?",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                RatingBar(
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemSize: 20.w,
                  initialRating: initialRate,
                  itemCount: 5,
                  unratedColor: Colors.red.withAlpha(50),
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                    full: Image.asset(
                      "hearts/heart.png",
                      color: Colors.red,
                    ),
                    half: Image.asset(
                      "hearts/heart_half.png",
                      color: Colors.red,
                    ),
                    empty: Image.asset(
                      "hearts/heart_border.png",
                      color: Colors.grey,
                    ),
                  ),
                  onRatingUpdate: (score) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        content: Text("저장되었습니다."),
                        actions: [
                          CustomBackButton(text: "닫기"),
                        ],
                      ),
                    );
                    setState(() {
                      rate = score;
                    });
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    isSave = true;
                  },
                  child: Text("저장하기"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _notEatingApplyButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isEating!) {
              // showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (context) {
              //       List valueList = ["당직", "휴가", "외출", "근무", "기타"];
              //       var _selectedValue = valueList[0];
              //       return AlertDialog(
              //         content: DropdownButton(
              //           value: _selectedValue,
              //           items: valueList
              //               .map((value) => DropdownMenuItem(
              //                     child: Text(value),
              //                     value: value,
              //                   ))
              //               .toList(),
              //           onChanged: (value) {
              //             _selectedValue = value;
              //           },
              //         ),
              //         actions: [
              //           Row(
              //             children: [
              //               ElevatedButton(
              //                 onPressed: () {
              //                   setState(() {
              //                     _selectedValue = value;
              //                   });
              //                 },
              //                 child: Text("신청하기"),
              //               ),
              //               CustomBackButton(text: '취소'),
              //             ],
              //           ),
              //         ],
              //       );
              //     });
              addUserNotEating(dateAndTime, time);
              isEating = false;
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  content: Text("불취식 신청 되었습니다."),
                  actions: [
                    CustomBackButton(text: "돌아가기"),
                  ],
                ),
              );
            } else {
              removeUserNotEating(dateAndTime, time);
              isEating = true;
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  content: Text("취식 신청 되었습니다."),
                  actions: [
                    CustomBackButton(text: '돌아가기'),
                  ],
                ),
              );
            }
          });
        },
        child: isEating! ? Text("불취식신청") : Text("취식신청"),
        style: ElevatedButton.styleFrom(
          primary: isEating! ? Colors.lightGreen[400] : Colors.lightBlue,
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }

  Widget _suggestingButton() {
    return ElevatedButton(
      onPressed: () {
        String pass = "";
        for (String i in menuList) {
          pass += "$i, ";
        }
        Get.to(
          () => WriteSuggestionPage(
            title: "${getMonthDayAndWeekdayInKorean(dateAndTime)} $time 건의합니다",
            content: pass,
          ),
        );
      },
      child: Text("건의하기"),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
