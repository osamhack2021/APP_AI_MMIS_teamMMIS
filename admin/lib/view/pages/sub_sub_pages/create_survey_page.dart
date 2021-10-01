import 'package:admin/controller/survey_controller.dart';
import 'package:admin/size.dart';
import 'package:admin/util/validators.dart';
import 'package:admin/view/components/home/customTitle.dart';
import 'package:admin/view/components/survey/single_choice.dart';

import 'package:admin/view/components/survey/survey_question_form_field.dart';
import 'package:admin/view/components/survey/survey_title_form_field.dart';
import 'package:admin/view/pages/frame_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style.dart';
import '../login_page.dart';

class CreateSurveyPage extends StatefulWidget {
  @override
  _CreateSurveyPageState createState() => _CreateSurveyPageState();
}

class _CreateSurveyPageState extends State<CreateSurveyPage> {
  SurveyController s = Get.put(SurveyController());
  late SurveyTitleFormField surveyTitleFormField;

  @override
  void initState() {
    s.questions.add(
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
            padding: EdgeInsets.all(gap_xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTitle("설문조사 생성"),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        s.title!.value =
                            surveyTitleFormField.titleController.text;
                        s.explain!.value =
                            surveyTitleFormField.explainController.text;
                        print("--------");
                        print(s.title);
                        print(s.explain);
                        for (SurveyQuestionFormField i in s.questions) {
                          print(i.questionController.text);
                          print(i.isCompulsory);
                          print(i.choiceType);
                          for (TextEditingController j
                              in i.choiceType!.textEditingControllers) {
                            print(j.text);
                          }
                        }
                        print("-----");
                      },
                      child: Text("올리기"),
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
                  children:
                      <Widget>[surveyTitleFormField] + _buildQuestionList(),
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
      s.questions.add(
          SurveyQuestionFormField(key: UniqueKey(), index: s.questions.length));
    });
  }

  void _removeSurveyQuestionFormField(int index) {
    setState(() {
      s.questions.removeAt(index);
      for (SurveyQuestionFormField i in s.questions) {
        i.index = s.questions.indexOf(i);
      }
    });
  }

  List<Widget> _buildQuestionList() {
    return List.generate(s.questions.length, (index) {
      return Column(
        children: [
          s.questions[index],
          Row(
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
          )
        ],
      );
    });
  }
}
