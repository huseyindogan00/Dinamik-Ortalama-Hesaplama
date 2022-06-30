import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  const CreditDropdownWidget({Key? key, required this.onSelectedCredit}) : super(key: key);

  final Function onSelectedCredit;

  @override
  State<CreditDropdownWidget> createState() => CreditDropdownWidgetState();
}

var creditKey = GlobalKey<State>();

class CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectCredit = Constants.creditDefaultValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.dropButtonPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        key: creditKey,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        underline: Container(),
        items: DataHelper.getLessonsOfCredit(),
        value: selectCredit,
        onChanged: (credit) {
          setState(
            () {
              selectCredit = credit!;
              widget.onSelectedCredit(selectCredit);
            },
          );
        },
      ),
    );
  }
}
