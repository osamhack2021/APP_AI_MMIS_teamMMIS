import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/components/appBar/sub_page_appbar.dart';
import 'package:myapp/view/components/custom_drawer.dart';

class DoSurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPageAppBar("설문조사 하기"),
      drawer: CustomDrawer(),
      body: ConditionalQuestions(
        children: [
          Question(
            question: "너는 누구인가요?",
          ),
          PolarQuestion(question: "하나 고르세요", answers: ["1", "2", "3"]),
        ],
      ),
    );
  }
}
