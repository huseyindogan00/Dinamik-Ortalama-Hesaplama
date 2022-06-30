import 'package:dinamik_ortalama_hesaplama/constants/constants.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({Key? key, required this.onTextField}) : super(key: key);

  final Function onTextField;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
          hintText: 'Matematik',
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
      onSaved: (newValue) {
        onTextField(newValue);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders adını giriniz';
        }
        _textController.text = '';
        return null;
      },
    );
  }
}
