import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:flutter/material.dart';

class AverageShow extends StatelessWidget {
  final double average;
  final int numberOfLesson;
  const AverageShow({required this.numberOfLesson, required this.average, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLesson > 0 ? '$numberOfLesson Ders Girildi' : 'Ders Seçiniz',
          style: Constants.numberOfLessonTextStyle,
        ),
        Text(
          average >= 0.0 ? average.toStringAsFixed(2) : '0.0',
          style: Constants.averageTitleStyle,
        ),
        const Text(
          'Ortalama',
        ),
      ],
    );
  }
}
