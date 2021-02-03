

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomColors {

  static const backgroundColor = Color(0xFF2A363B);
}

class CustomTextStyle {

  static const defaultRegularStyle = TextStyle(
    fontSize: 14,
    color: Colors.white
  );

  static const defaultRegularStyle12 = TextStyle(
      fontSize: 12,
      color: Colors.white
  );

  static const defaultBoldStyle = TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold
  );

  static  inputDecoration(labelText) => InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 18, color: Colors.white ),
    hoverColor: Colors.white,
    filled: true,
    fillColor: Colors.white.withOpacity(.3),
    focusColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.transparent),
    ),
  );


}