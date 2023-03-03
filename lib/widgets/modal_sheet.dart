// requesting for model sheet
import 'package:flutter/material.dart';

void requestModelSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return child;
      });
}
