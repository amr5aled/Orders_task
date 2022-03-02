import 'package:flutter/material.dart';

import 'app_text_display.dart';


showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(
    text: text,
  )));
}
