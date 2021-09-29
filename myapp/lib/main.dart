import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/view/pages/subpages/do_survey_page.dart';

import 'view/pages/initialpages/framepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      title: "MMIS project myapp",
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: DoSurveyPage(),
    );
  }
}
