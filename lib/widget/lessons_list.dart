// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonsList extends StatelessWidget {
  final Function onDismiss;

  List<Lesson> allLessonList = DataHelper.allLesson;

  LessonsList({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allLessonList.isNotEmpty
        ? ListView.builder(
            itemCount: allLessonList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    onDismiss(index);
                  }
                },
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Constants.listIconColor,
                        foregroundColor: Colors.white,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(allLessonList[index].name),
                      subtitle: Text(
                        '${allLessonList[index].creditValue} Kredi, Not Değeri ${allLessonList[index].letterValue}',
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Text(
              Constants.listInfoText,
              style: Constants.numberOfLessonTextStyle,
            ),
            alignment: Alignment.center,
          );
  }
}
