import 'package:flutter/material.dart';

class NutritionBox extends StatelessWidget {
  final int? calories;
  final int? carbohydrate;
  final int? protein;
  final int? fat;

  final int? salt;
  final int? cholesterol;
  final TextStyle _textStyle = TextStyle(fontSize: 12, color: Colors.black54);

  NutritionBox({
    this.carbohydrate = 0,
    this.protein = 0,
    this.fat = 0,
    this.salt = 0,
    this.cholesterol = 0,
    this.calories = 0,
  });
  // NutritionBox.fromJson(Map<String, dynamic> nutrition)
  //     : carbohydrate = nutrition["탄수화물"] ?? "-",
  //       protein = nutrition["단백질"] ?? "-",
  //       fat = nutrition["지방"] ?? "-",
  //       salt = nutrition["나트륨"] ?? "-",
  //       cholesterol = nutrition["콜레스테롤"] ?? "-";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text("칼로리 ${calories}Kcal", style: _textStyle)),
              Expanded(
                  flex: 1,
                  child: Text("탄수화물 ${carbohydrate}g", style: _textStyle)),
              Expanded(
                  flex: 1, child: Text("단백질 ${protein}g", style: _textStyle)),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text("지방 ${fat}g", style: _textStyle)),
              Expanded(
                  flex: 1, child: Text("나트륨 ${salt ?? 0}g", style: _textStyle)),
              Expanded(
                  flex: 1,
                  child: Text("콜레스테롤 ${cholesterol}g", style: _textStyle)),
            ],
          ),
        ],
      ),
    );
  }
}
