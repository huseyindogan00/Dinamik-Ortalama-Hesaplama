import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:dinamik_ortalama_hesaplama/widget/average_show.dart';
import 'package:flutter/material.dart';

class AverageCalculatePage extends StatefulWidget {
  const AverageCalculatePage({Key? key}) : super(key: key);

  @override
  State<AverageCalculatePage> createState() => _AverageCalculatePageState();
}

class _AverageCalculatePageState extends State<AverageCalculatePage> {
  var formKey = GlobalKey<FormState>();
  double selectLetter = 4.0;
  double selectCredit = 1;
  String lessonName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Container(
              color: Colors.blue,
              child: const Text('Liste Buraya gelicek'),
            ),
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
                  child: _buildTextFormField(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: Constants.defaultPadding,
                      child: _buildLetters(),
                    ),
                    Padding(
                      padding: Constants.defaultPadding,
                      child: _buildCredit(),
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
            )));
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
          hintText: 'Matematik',
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
      onSaved: (newValue) {
        setState(() {
          lessonName = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders adını giriniz';
        }
        return null;
      },
    );
  }

  Widget _buildLetters() {
    return Container(
      padding: Constants.dropButtonPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Constants.mainColor.shade200,
          underline: Container(),
          items: DataHelper.getLessonsOfLetters(),
          value: selectLetter,
          onChanged: (value) {
            setState(() {
              selectLetter = value!;
            });
          }),
    );
  }

  Widget _buildCredit() {
    return Container(
      padding: Constants.dropButtonPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Constants.mainColor.shade200,
          underline: Container(),
          items: DataHelper.getLessonsOfCredit(),
          value: selectCredit,
          onChanged: (credit) {
            setState(() {
              selectCredit = credit!;
            });
          }),
    );
  }

  void _calculateCourseAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lesson = Lesson(name: lessonName, letterValue: selectLetter, creditValue: selectCredit);

      DataHelper.addLesson(lesson);
      setState(() {});
    }
  }
}
