import 'package:blog_post/views/common_widgets/text_box_view.dart';
import 'package:flutter/material.dart';

renderTextBox(
    {controller,
    label,
    errorMessage,
    errorFieldCheck,
    obscure,
    prefix,
    suffix}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextBoxView(
      // onChanged: (value) => controller.text = value,
      textController: controller,
      obscureText: obscure,
      label: label,
      prefix: prefix,
      error: errorFieldCheck ? null : errorMessage,
    ),
  );
}
