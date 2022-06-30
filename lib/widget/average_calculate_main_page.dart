import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:dinamik_ortalama_hesaplama/widget/average_show.dart';
import 'package:dinamik_ortalama_hesaplama/widget/credit_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widget/lessons_list.dart';
import 'package:dinamik_ortalama_hesaplama/widget/letter_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AverageCalculateMainPage extends StatefulWidget {
  const AverageCalculateMainPage({Key? key}) : super(key: key);
  @override
  State<AverageCalculateMainPage> createState() => _AverageCalculateMainPageState();
}

class _AverageCalculateMainPageState extends State<AverageCalculateMainPage> {
  var formKey = GlobalKey<FormState>();
  double selectLetter = 4.0;
  double selectCredit = 1;
  String lessonName = '';

  @override
  Widget build(BuildContext context) {
    print('scaffold çalıştııııııııııııııııııııııııııııııııııııı');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Constants.appBarTitleStyle,
            style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: AverageShow(
                  numberOfLesson: DataHelper.allLesson.length,
                  average: DataHelper.averageCalculate(),
                ),
              ),
            ],
          ),
          Expanded(
            child: LessonsList(onDismiss: (index) {
              setState(() {
                DataHelper.allLesson.removeAt(index);
              });
            }),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.defaultPadding,
              child: TextFormFieldWidget(onTextField: (value) {
                lessonName = value;
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: Constants.defaultPadding,
                  child: LetterDropdownWidget(onSelectedLetter: (selectedLetter) {
                    selectLetter = selectedLetter;
                  }),
                ),
                Padding(
                  padding: Constants.defaultPadding,
                  child: CreditDropdownWidget(onSelectedCredit: (selectedCredit) {
                    selectCredit = selectedCredit;
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  iconSize: 30,
                  color: Constants.iconColor,
                  onPressed: _calculateCourseAverage,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _calculateCourseAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lesson = Lesson(name: lessonName, letterValue: selectLetter, creditValue: selectCredit);

      setState(() {
        DataHelper.addLesson(lesson);
      });
    }
  }
}
