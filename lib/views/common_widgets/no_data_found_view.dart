import 'package:blog_post/utils/styling.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Widget NoDataFound({message}) {
  return Center(
    child: Text(
      message,
      style: AppTheme.errorTextTheme,
    ),
  );
}
