//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/services.dart';

import '/all.dart';
import '_w_text_field_event_builder.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFieldCopyButton extends WTextFieldEventBuilder {
  //
  //
  //

  final void Function(String)? onCopy;
  final Widget? icon;

  //
  //
  //

  const WTextFieldCopyButton({
    this.onCopy,
    this.icon,
  });

  //
  //
  //

  @override
  Widget builder(final event) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final text = event.text ?? "";
        await Clipboard.setData(ClipboardData(text: text));
        onCopy?.call(text);
      },
      child: Padding(
        padding: EdgeInsets.all($4),
        child: this.icon ?? WIcon(Icons.copy_outlined),
      ),
    );
  }
}
