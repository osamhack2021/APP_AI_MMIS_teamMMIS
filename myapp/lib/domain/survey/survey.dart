class Survey {
  String? id;
  String? title;
  String? explain;
  List<Map<String, dynamic>>? questions;
  String? createTime;
  Survey({this.id, this.title, this.explain, this.questions, this.createTime});

  Survey.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        explain = json["explain"],
        questions = json["questions"],
        createTime = json["create"];
}

Map<String, dynamic> DumSurvey = {
  "id": "1",
  "title": "21-3차 급식 만족도 설문조사입니다.",
  "explain": "성의껏 답변 부탁드립니다.",
  "questions": [
    {
      "id": "1",
      "text": "예시 질문입니다.",
      "type": "단답식",
      "isOptional": "no",
      // 선지입니다.
      "options": [],
    },
    {
      "id": "2",
      "text": "가장 좋아하는 메뉴는 무엇입니까?",
      "type": "다수선택",
      "isOptional": "no",
      // 선지입니다.
      "options": [
        "피자",
        "치킨",
        "라면",
        "통닭",
        "없음",
      ],
    },
    {
      "id": "3",
      "text": "급식 관련 의견을 자유롭게 써주세요",
      "type": "단답식",
      "isOptional": "no",
      // 선지입니다.
      "options": [],
    },
  ],
  //questions의 객체의 개수만큼 빈 리스트를 객체로 생성..
  // 못 하시겠으면, 프론트에서도 처리 가능..
  "result": [
    [],
    [],
    [],
    [],
  ],
  "create": "2021-07-10T08:05:49.068049",
  "update": "2021-07-10T08:05:49.068049",
};
