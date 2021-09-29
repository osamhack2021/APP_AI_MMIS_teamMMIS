import 'package:get/get.dart';

const host = "https://cors-anywhere.herokuapp.com/http://52.78.37.19:8080/";

class EXProvider extends GetConnect {
  Future<Response> connect() {
    return get(host);
  }
}
