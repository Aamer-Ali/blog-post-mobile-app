import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class TextBoxView extends GetView {
  String? label;
  String? error;
  bool? obscureText;
  Widget? prefix;
  Widget? suffix;
  TextEditingController? textController;
  int? maxLines;
  bool? isForNumbers;
  final void Function(String)? onChanged;
  final void Function()? onSuffixIconTap;

  TextBoxView(
      {Key? key,
      this.label,
      this.error,
      this.obscureText,
      this.prefix,
      this.suffix,
      this.onChanged,
      this.onSuffixIconTap,
      this.textController,
      this.maxLines = 1,
      this.isForNumbers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: onChanged,
      obscureText: obscureText!,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          alignLabelWithHint: true,
          labelText: label,
          hintText: label,
          errorText: error,
          prefixIcon: prefix == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: prefix,
                ),
          suffixIcon: suffix == null
              ? null
              : InkWell(onTap: onSuffixIconTap, child: suffix)),
    );
  }
}
