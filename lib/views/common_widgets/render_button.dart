import 'package:blog_post/controllers/login_controller.dart';
import 'package:flutter/material.dart';

renderButton({required Function() onClick, label}) {
  return TextButton(
    onPressed: onClick,
    child: Text(label),
  );
}
