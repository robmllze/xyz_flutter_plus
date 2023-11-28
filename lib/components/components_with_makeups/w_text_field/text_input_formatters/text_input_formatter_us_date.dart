//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/services.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TextInputFormatter_USDate extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(final oldValue, final newValue) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r"[^\d]+"), ""); // remove any non-digit characters
    final l = text.length;

    if (l > 1 && l <= 2) {
      text = "$text/";
    } else if (l == 3) {
      text = "${text.substring(0, 2)}/${text.substring(2)}";
    } else if (l > 3 && l < 5) {
      text = "${text.substring(0, 2)}/${text.substring(2)}/";
    } else if (l == 5) {
      text = "${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}";
    } else if (l > 5 && l < 8) {
      text = "${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}";
    } else {
      text = "${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4, 8)}";
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
