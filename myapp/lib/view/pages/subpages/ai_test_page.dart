import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/ai_controller.dart';
import 'package:myapp/controller/dto/CM_request_dto.dart';
import 'package:myapp/domain/AI/ai.dart';
import 'package:myapp/view/components/ai_menu_input_form.dart';
import 'package:myapp/view/components/appBar/sub_page_appbar.dart';
import 'package:myapp/view/components/button/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/view/pages/subpages/write_suggestion_page.dart';

class AiTestPage extends StatefulWidget {
  @override
  _AiTestPageState createState() => _AiTestPageState();
}

class _AiTestPageState extends State<AiTestPage> {
  final AIController ai = Get.put(AIController());
  late bool yesInput;
  AIMenuInputForm _aiMenuInputForm = AIMenuInputForm(
    key: UniqueKey(),
  );
  List<String>? inputMenus;
  @override
  void initState() {
    yesInput = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: subPageAppBar("AI 실험실"),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: ListView(
          children: [
            Text(
              "급식이 1.0.0",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "급식이 1.0.0은 급식 관리자들이 메뉴를 구성할 때, 도와주는 인공지능 모델입니다. 식단을 입력하면, 부대원들에 대한 이 식단의 적합도와 대체 추천 식단을 구해 줍니다. 구성한 식단을 테스트해보세요.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 32.h),
            yesInput == true
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[200]!),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "식단을 테스트해 보세요.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            _aiMenuInputForm,
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        funpageRoute: () async {
                          if (_aiMenuInputForm.formKey.currentState!
                              .validate()) {
                            List<String> menus = _aiMenuInputForm
                                .menuInputTextField
                                .map((e) => e.controller.text.trim())
                                .toList();
                            // await ai.getRecommendedMenus(menus);
                            setState(() {
                              yesInput = false;
                              inputMenus = menus;
                            });
                          }
                        },
                        text: "입력 !",
                        width: double.infinity,
                      ),
                    ],
                  )
                : _result(),
          ],
        ),
      ),
    );
  }

  Widget _result() {
    return Obx(
      () => Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomElevatedButton(
                    funpageRoute: () {
                      setState(() {
                        yesInput = true;
                        _aiMenuInputForm = AIMenuInputForm(
                          key: UniqueKey(),
                        );
                      });
                    },
                    text: "다시 하기",
                    textStyle: TextStyle(fontSize: 24),
                    primary: Colors.lightGreen,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: CustomElevatedButton(
                    funpageRoute: () {
                      String pass = "";
                      for (String i in inputMenus!) {
                        pass += "$i, ";
                      }
                      Get.to(
                        () => WriteSuggestionPage(
                          title: "다음 메뉴 건의합니다.",
                          content: pass,
                        ),
                      );
                    },
                    text: "메뉴 건의",
                    textStyle: TextStyle(fontSize: 24),
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: 200.h,
              height: 200.h,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("이 식단의 점수는?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(),
                  Text(
                    "5점",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "좋음 ",
                        style: TextStyle(
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen),
                      ),
                      FaIcon(
                        // 보통은 meh, 별로는 frown
                        FontAwesomeIcons.smile,
                        size: 60.sp,
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 250.r,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "추천식단",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "다음 식단들은 어떠신가요?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "아래 식단을 급식 담당자에게 건의하세요!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _recommendedDiets(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendedDiets() {
    CMRespDto cmResDto = CMRespDto.fromJson(a);
    ai.principal.value = AI.fromJson(cmResDto.data);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          List.generate(ai.principal.value.getRecommendation().length, (index) {
        Recommendation recommendation =
            ai.principal.value.getRecommendation()[index];
        return InkWell(
          onTap: () {
            String pass = "";
            for (String i in recommendation.menus!) {
              pass += "$i, ";
            }
            Get.to(
              () => WriteSuggestionPage(
                title: "다음 메뉴 건의합니다.",
                content: pass,
              ),
            );
          },
          child: Container(
            width: 0.3.sw,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 0.1,
                  )
                ]),
            padding: EdgeInsets.all(8.r),
            margin: EdgeInsets.all(8.r),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "${recommendation.score}점",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                Divider(color: Colors.grey),
                Column(
                  children:
                      recommendation.menus!.map((menu) => Text(menu)).toList(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
