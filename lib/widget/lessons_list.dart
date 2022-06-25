import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonsList extends StatefulWidget {
  const LessonsList({Key? key}) : super(key: key);

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  List<Lesson> allLessonList = DataHelper.allLesson;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allLessonList.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.amber.shade300,
          child: ListTile(
            leading: Text('${index + 1}'),
            title: Text(allLessonList[index].name),
            subtitle: Text(
              '${allLessonList[index].creditValue} Kredi, Not Değeri ${allLessonList[index].letterValue}',
            ),
          ),
        );
      },
    );
  }
}
