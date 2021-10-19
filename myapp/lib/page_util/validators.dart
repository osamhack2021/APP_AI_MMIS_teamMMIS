import 'package:myapp/page_util/reg_ex.dart';
import 'package:validators/validators.dart';

import 'Info.dart';

Function validateMilitaryNumber() {
  return (String? value) {
    if (value!.isEmpty) {
      return "군번를 기입하십시오.";
    } else if (!isMilitaryNumber(value)) {
      return "군번 형식이 잘못 되었습니다.";
    } else if (value.length > 20) {
      return "입력값이 너무 깁니다.";
    } else {
      return null;
    }
  };
}

Function validatePassWorld() {
  return (String? value) {
    if (value!.isEmpty) {
      return "비밀번호를 기입하십시오.";
    } else if (!isAlphanumeric(value)) {
      return "비밀번호는 영문과 숫자만 가능합니다.";
    } else if (value.length > 15) {
      return "비밀번호는 15자 이하로 해주십시오.";
    } else if (value.length < 4) {
      return "비밀번호는 4자 이상으로 해주십시오.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "Email을 기입하십시오.";
    } else if (!isEmail(value)) {
      return "이메일 형식이 아닙니다.";
    } else {
      return null;
    }
  };
}

Function validateEmpty() {
  return (String? value) {
    if (value!.isEmpty) {
      return "Email을 기입하십시오.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목이 너무 깁니다. 30자 이하로 쓰세요.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "글 분량을 초과했습니다. 500자 이하";
    } else {
      return null;
    }
  };
}

Function validateName() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백으로 둘 수 없습니다.";
    } else if (value.length > 10) {
      return "입력된 글자가 너무 많습니다.";
    } else {
      return null;
    }
  };
}

final classNames = [
  "이병",
  "이등병",
  "일병",
  "일등병",
  "상병",
  "상등병",
  "병장",
  "하사",
  "중사",
  "상사",
  "원사",
  "준위",
  "소위",
  "중위",
  "대위",
  "소령",
  "중령",
  "대령",
  "준장",
  "소장",
  "중장",
  "대장"
];

Function validateClass() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백으로 둘 수 없습니다.";
    } else if (classNames.contains(value) != true) {
      return "입력값이 잘못되었습니다.";
    } else {
      return null;
    }
  };
}

Function validateUnit() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백으로 둘 수 없습니다.";
    } else if (value.length > 50) {
      return "입력된 글자가 너무 많습니다.";
    } else {
      return null;
    }
  };
}

Function validateHeight() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백으로 둘 수 없습니다.";
    } else if (double.tryParse(value) == null) {
      return "입력값이 잘못되었습니다.";
    } else {
      return null;
    }
  };
}

Function validateMenu() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!Menus.menus.contains(value)) {
      return "없는 메뉴입니다.";
    } else
      return null;
  };
}
