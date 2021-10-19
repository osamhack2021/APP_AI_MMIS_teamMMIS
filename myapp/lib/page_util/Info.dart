import 'package:myapp/domain/menu/menu.dart';

class Rank {
  static final List<String> ranks = [
    "대장",
    "중장",
    "소장",
    "준장",
    "대령",
    "중령",
    "소령",
    "대위",
    "중위",
    "소위",
    "준위",
    "원사",
    "상사",
    "중사",
    "하사",
    "군무원 1급",
    "군무원 2급",
    "군무원 3급",
    "군무원 4급",
    "군무원 5급",
    "군무원 6급",
    "군무원 7급",
    "군무원 8급",
    "군무원 9급",
    "군무원 10급",
    "공무원 1급",
    "공무원 1급",
    "공무원 2급",
    "공무원 3급",
    "공무원 4급",
    "공무원 5급",
    "공무원 6급",
    "공무원 7급",
    "공무원 8급",
    "공무원 9급",
    "공무원 10급",
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(ranks);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class MilitaryUnit {
  static final List<String> units = [
    '공군 제xx전투비행단',
    '육군 제**사단',
    '육군 제**사단',
    '육군 제**사단',
    '육군 제**사단',
    '육군 1xx연대',
    '해병대 xx부대',
    '국방부 ??정책과',
    '국방부 xx정책과',
    '공군 제a전투비행단',
    '공군 제b전투비행단',
    '공군 제c전투비행단',
    '공군 제d전투비행단',
    '공군 제e전투비행단',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(units);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class Menus {
  static List<String> menus = [
    "고순조",
    "밥",
    "김치찌개",
    "닭각정",
    "영양밥",
    "야채샐러드",
    "콩나물국",
    "버섯된장국"
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(menus);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

Map<String, Map<String, dynamic>> menusAndNutrition =
    {}; // ex {"김치" : {"칼로리" : "100", "우유"}}
Map<String, Map<String, dynamic>> menusAndAllergy = {};
getMenusAndAllergyMap(List<Menu> menus) {
  Map<String, Map<String, dynamic>> result = {};
  for (Menu m in menus) {
    result[m.name ?? ""] = m.allergy ??
        {
          "계란류": 0,
          "우유": 0,
          "메밀": 0,
          "땅콩": 0,
          "대두": 0,
          "밀": 0,
          "고등어": 0,
          "게": 0,
          "새우": 0,
          "돼지고기": 0,
          "복숭아": 0,
          "토마토": 0,
          "아황산류": 0,
          "호두": 0,
          "닭고기": 0,
          "쇠고기": 0,
          "오징어": 0,
          "조개류": 0,
          "잣": 0,
        };
  }
  menusAndAllergy = result;
}

getMenusAndNutritionMap(List<Menu> menus) {
  Map<String, Map<String, dynamic>> result = {};
  for (Menu m in menus) {
    result[m.name ?? ""] = m.nutrition ??
        {"칼로리": 0, "탄수화물": 0, "지방": 0, "단백질": 0, "나트륨": 0, "콜레스테롤": 0};
  }
  menusAndNutrition = result;
}
