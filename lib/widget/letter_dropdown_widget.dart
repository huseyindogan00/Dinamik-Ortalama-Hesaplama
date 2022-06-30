import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidget extends StatefulWidget {
  const LetterDropdownWidget({Key? key, required this.onSelectedLetter}) : super(key: key);
  final Function onSelectedLetter;

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectLetter = Constants.letterDefaultValue;
  @override
  Widget build(BuildContext context) {
    print('letter dropdown çalştııııııııııııııııııııııııııııııııııııııı');
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
              widget.onSelectedLetter(selectLetter);
            });
          }),
    );
  }
}
