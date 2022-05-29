import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';

abstract class CustomSelectableText {
  static text(String text) {
    return SelectableText(
      text,
      style: StyleForText.smallStyle,
      textAlign: TextAlign.center,
      onTap: () {},
      toolbarOptions: const ToolbarOptions(
        copy: true,
        selectAll: true,
      ),
      showCursor: true,
      cursorWidth: 2,
      cursorRadius: const Radius.circular(5),
    );
  }
}
