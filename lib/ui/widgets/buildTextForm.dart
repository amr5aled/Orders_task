import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Container buildTextForm(
  String oldData, [
  String? sideText,
  Icon? sideIcon,
  TextInputType? mytype,
  bool secret = false,
  int? lines,
  bool bordeRradius = true,
  bool Enabled = true,
  int? length,
]) {
  return new Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: bordeRradius
          ? BorderRadius.circular(5.0)
          : BorderRadius.circular(0.0),
    ),
    child: TextFormField(
      enabled: Enabled,
      decoration: InputDecoration(
        suffixText: sideText,
        hintText: oldData,
        suffixIcon: sideIcon,
        contentPadding: EdgeInsets.all(15.0),
      ),
      obscureText: secret,
      keyboardType: mytype,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter that Field';
        }
        return null;
      },
      maxLines: lines,
      inputFormatters: [LengthLimitingTextInputFormatter(length)],
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}
