import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SpaceMoonText extends StatelessWidget {
  String text = "";
  SpaceMoonText(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(fontFamily: 'SpaceMoon'),
      textAlign: TextAlign.justify,
    );
  }
}

// made the input field more standardised throughout the app
class customInputWidget extends StatelessWidget {
  TextEditingController mycontroller;
  Icon icon;
  String lable;
  customInputWidget(this.mycontroller, this.lable, this.icon,{Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: lable,
        ),
        controller: mycontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a $lable";
          }
          return null;
        });
  }
}
