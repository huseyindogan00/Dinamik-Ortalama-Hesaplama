import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/widget/average_calculate_main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AverageCalculateMainPage(),
    );
  }
}
