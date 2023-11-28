//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';
import '_w_text_field_event_builder.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFieldCallButton extends WTextFieldEventBuilder {
  //
  //
  //

  const WTextFieldCallButton();

  //
  //
  //

  @override
  Widget builder(final event) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final url = Uri(
          scheme: "tel",
          path: event.text,
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Padding(
        padding: EdgeInsets.all($4),
        child: WIcon(Icons.call_outlined),
      ),
    );
  }
}
