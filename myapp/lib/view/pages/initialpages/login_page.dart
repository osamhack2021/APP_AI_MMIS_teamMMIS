import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/diet_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/page_util/validators.dart';
import 'package:myapp/view/components/button/custom_elevated_button.dart';
import 'package:myapp/view/components/textfield/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'framepage.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final u = Get.put(UserController());
  final _militaryNumber = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                //아이디 비번 입력할떄 키보드가 올라와서 스크롤이 돼야함
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Image.asset(
                    "logo/logo_mmis.png",
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Text(
                      "군 급식 정보 체계",
                      style: TextStyle(
                          fontSize: 32.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen),
                    ),
                  ),
                  SizedBox(height: 16.w),
                  _loginForm(), ////////////////////////밑에 만들어놈
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    //이름입력, 군번입력, 로그인 버튼, 회원가입 버튼 네개로 이루어짐
    return Form(
      key: _formKey,
      //한번에 서버로 날릴거라 이 네개를 폼으로 묶는게 좋음
      child: Column(
        children: [
          CustomTextFormField(
            controller: _militaryNumber,
            hint: "군번",
          ),
          CustomTextFormField(
            controller: _password,
            obscureText: true,
            hint: "비밀번호",
            funValidate: validatePassWorld(),
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            width: double.infinity,
            text: "로그인",
            funpageRoute: () async {
              if (_formKey.currentState!.validate()) {
                await u.login(
                    _militaryNumber.text.trim(), _password.text.trim());
                DateTime now = DateTime.now();
                final d = Get.put(DietController());
                await d.findMonth(now.year.toString(), now.month.toString());
                Get.off(() => FramePage());
              }
            },
          ),
          SizedBox(height: 10.h),
          TextButton(
            child: Text("회원가입"),
            onPressed: () {
              Get.off(() => JoinPage()); //회원가입페이지로 이동
            },
          ),
        ],
      ),
    );
  }
}
