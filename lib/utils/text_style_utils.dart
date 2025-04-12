// lib/utils/text_style_utils.dart
import 'package:flutter/material.dart';

TextStyle getThemeAwareTextStyle(
    BuildContext context,
    TextStyle? providedStyle,
    ) {
  final defaultTextStyle = DefaultTextStyle.of(context);
  var effectiveTextStyle = providedStyle;
  if (providedStyle == null || providedStyle.inherit) {
    effectiveTextStyle = defaultTextStyle.style.merge(providedStyle);
  }

  // Apply bold manually, if necessary:
  effectiveTextStyle = effectiveTextStyle!.merge(
    const TextStyle(fontWeight: FontWeight.bold),
  );

  return effectiveTextStyle;
}
