import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/page_util/validators.dart';
import 'package:myapp/user/user_ex.dart';
import 'package:myapp/view/components/textfield/user_info_text_form_field.dart';
import 'package:myapp/view/pages/subpages/user_edit_page.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController u = Get.put(UserController());
    final List<String> allergies = [];
    for (String i in userAllergy.keys) {
      if (userAllergy[i] == true) allergies.add(i);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원정보",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          left: 20.w,
          right: 20.w,
          bottom: 30.h,
        ),
        child: ListView(
          children: [
            UserInfoTextFormField(
              validator: validateEmpty(),
              controller: TextEditingController(),
              obscureText: false,
              text: "소속",
              info: "${u.principal.value.unit}",
              enabled: false,
            ),
            UserInfoTextFormField(
              validator: validateEmpty(),
              controller: TextEditingController(),
              obscureText: false,
              text: "계급",
              info: "${u.principal.value.rank}",
              enabled: false,
            ),
            UserInfoTextFormField(
              validator: validateEmpty(),
              controller: TextEditingController(),
              obscureText: false,
              text: "군번",
              info: "${u.principal.value.militaryNumber}",
              enabled: false,
            ),
            UserInfoTextFormField(
              validator: validateEmpty(),
              controller: TextEditingController(),
              obscureText: false,
              text: "이름",
              info: "${u.principal.value.username}",
              enabled: false,
            ),
            UserInfoTextFormField(
              validator: validateEmpty(),
              controller: TextEditingController(),
              obscureText: true,
              text: "비밀번호",
              info: "*********",
              enabled: false,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: allergies.length != 0
                  ? Column(
                      children: [
                        Text(
                          "보유 알레르기",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 2.sp,
                        ),
                        Wrap(
                          spacing: 8.sp,
                          children: List.generate(
                            allergies.length,
                            (index) => Text(allergies[index]),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          "알레르기",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        Text("없음",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp))
                      ],
                    ),
            ),
            Divider(),
            SizedBox(height: 8.h),
            Center(
              child: TextButton(
                child: Text(
                  "수정하기",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  localUserAllergy = userAllergy;
                  Get.to(() => UserEditPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
