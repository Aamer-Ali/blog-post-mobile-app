import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

Widget ProgressView({message}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CupertinoActivityIndicator(),
      const SizedBox(
        height: 12.0,
      ),
      FadingText(message),
    ],
  );
}
