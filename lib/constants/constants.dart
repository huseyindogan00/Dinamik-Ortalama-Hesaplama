import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.indigo;
  static const String appBarTitleStyle = 'Ortalama Hesapla';
  static TextStyle titleStyle = GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static Color iconColor = Colors.indigo.shade400;
  static EdgeInsets defaultPadding = const EdgeInsets.all(8.0);
  static TextStyle numberOfLessonTextStyle =
      GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);
  static TextStyle averageTitleStyle =
      GoogleFonts.quicksand(fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);
  static const EdgeInsets dropButtonPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}
