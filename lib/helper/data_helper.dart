// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lesson> allLesson = [];

  static addLesson(Lesson lesson) {
    allLesson.add(lesson);
  }

  static averageCalculate() {
    double sumNote = 0;
    double sumCredit = 0;

    allLesson.forEach((lesson) {
      sumNote = sumNote + (lesson.creditValue * lesson.letterValue);
      sumCredit += lesson.creditValue;
    });

    return sumNote / sumCredit;
  }

  static List<Map<String, double>> get _lettersOfAllLessons {
    return [
      {'AA': 4.00},
      {'BA': 3.50},
      {'BB': 3.00},
      {'CB': 2.50},
      {'CC': 2.00},
      {'DC': 1.50},
      {'DD': 1.00},
      {'FD': 0.50},
      {'FF': 00}
    ];
  }

  static List<DropdownMenuItem<double>> getLessonsOfLetters() {
    return _lettersOfAllLessons
        .map((map) => DropdownMenuItem(
              value: map.values.first,
              child: Text(map.keys.first),
            ))
        .toList();
  }

  static List<DropdownMenuItem<double>> getLessonsOfCredit() {
    return List.generate(
        10,
        (index) => DropdownMenuItem(
              value: index + 1,
              child: Text('${index + 1}'),
            ));
  }
}
