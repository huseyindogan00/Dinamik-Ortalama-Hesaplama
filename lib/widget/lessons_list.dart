import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter/cupertino.dart';

class LessonsList extends StatefulWidget {
  const LessonsList({Key? key}) : super(key: key);

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {},
      itemCount: DataHelper.averageCalculate(),
    );
  }
}
