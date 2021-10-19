import 'package:admin/controller/survey_controller.dart';
import 'package:admin/model/survey.dart';
import 'package:admin/size.dart';
import 'package:admin/util/validators.dart';
import 'package:admin/view/components/home/customTitle.dart';

import 'package:admin/view/components/survey/survey_question_form_field.dart';
import 'package:admin/view/components/survey/survey_title_form_field.dart';
import 'package:admin/view/pages/frame_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style.dart';
import '../login_page.dart';

class CreateSurveyPage extends StatefulWidget {
  const CreateSurveyPage({Key? key}) : super(key: key);
  @override
  _CreateSurveyPageState createState() => _CreateSurveyPageState();
}

class _CreateSurveyPageState extends State<CreateSurveyPage> {
  SurveyController s = SurveyController();
  late SurveyTitleFormField surveyTitleFormField;
  late List<SurveyQuestionFormField> questions;
  late String title;
  late String explain;

  @override
  void initState() {
    questions = <SurveyQuestionFormField>[];
    title = "";
    explain = "";
    questions.add(
      SurveyQuestionFormField(
        index: 0,
        funValidate: validateTitle(),
      ),
    );

    surveyTitleFormField = SurveyTitleFormField();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = getMediaQueryWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            Get.offAll(() => FramePage());
          },
          child: Text(
            "MMIS",
            style: h4(),
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.offAll(() => LoginPage());
                },
                child: Text("로그아웃", style: h5()),
              ),
            ],
          ),
          SizedBox(width: gap_s),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: _width,
            padding: _width < 540
                ? const EdgeInsets.all(gap_m)
                : const EdgeInsets.all(gap_xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTitle("설문조사 생성"),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        dummySurvey.insert(
                            0,
                            FakeSurvey("21-3차 급식 만족도 설문조사입니다.", "관리자",
                                "2021.10.19", []));
                        Get.back();
                      },
                      //   title = surveyTitleFormField.titleController.text;
                      //   explain = surveyTitleFormField.explainController.text;
                      //   final sc = Get.put(SurveyController());
                      //   String seq = DateTime.now().toString();
                      //   int a =
                      //       await sc.postSurvey(title, explain, seq, questions);
                      //   if (a == 1) {
                      //     Get.back();
                      //   }
                      // },
                      child: Text("생성하기"),
                    ),
                    SizedBox(width: gap_m),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("목록"),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                Column(
                  children: <Widget>[
                        surveyTitleFormField,
                        _addAndRemoveQuestionForTitle(),
                      ] +
                      _buildQuestionList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addSurveyQuestionFormField() {
    setState(() {
      questions.add(
          SurveyQuestionFormField(key: UniqueKey(), index: questions.length));
    });
  }

  void _removeSurveyQuestionFormField(int index) {
    setState(() {
      questions.removeAt(index);
      for (SurveyQuestionFormField i in questions) {
        i.index = questions.indexOf(i);
      }
    });
  }

  List<Widget> _buildQuestionList() {
    return List.generate(questions.length, (index) {
      return Column(
        children: [questions[index], _addAndRemoveQuestion(index)],
      );
    });
  }

  Widget _addAndRemoveQuestionForTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _addSurveyQuestionFormField();
          },
        ),
      ],
    );
  }

  Widget _addAndRemoveQuestion(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _addSurveyQuestionFormField();
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeSurveyQuestionFormField(index);
          },
        )
      ],
    );
  }
}
