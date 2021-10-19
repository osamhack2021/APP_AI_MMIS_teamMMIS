class FakeSurvey {
  final String title;
  final String writer;
  final String date;
  final List<Map> questionSets;

  FakeSurvey(this.title, this.writer, this.date, this.questionSets);
}

List<FakeSurvey> dummySurvey = [
  FakeSurvey("1. 예시설문조사입니다.", "관리자", "2021.09.23", [
    {
      "질문": "가장 좋아하는 메뉴는 무엇입니까?",
      "선지": ["돈가스", "치킨", "라면", "김치"],
      "결과": [1, 3, 2, 1],
    },
    {
      "질문": "가장 좋아하는 음료는 무엇입니까?",
      "선지": ["콜라", "사이다", "우유", "식혜"],
      "결과": [3, 2, 1, 4],
    },
    {
      "질문": "양은 적당합니까?",
      "선지": ["매우만족", "만족", "보통", "불만족", "매우 불만족"],
      "결과": [5, 1, 2, 4, 3],
    },
    {
      "질문": "원하는 메뉴를 한 개 이상 골라주세요 ",
      "선지": ["냉모밀", "삼겹살", "피자", "치킨", "칼국수"],
      "결과": [5, 1, 2, 4, 3],
    },
  ]),
];

List<List> zip(List list1, List list2) {
  List<List> result = [];
  if (list1.length == list2.length) {
    for (int index = 0; index < list1.length; index++) {
      List a = [list1[index], list2[index]];
      result.add(a);
    }
  }
  return result;
}
