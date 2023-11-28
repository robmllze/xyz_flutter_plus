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

class WTextFieldEmailButton extends WTextFieldEventBuilder {
  //
  //
  //

  final String emailSubject;
  final String emailBody;

  final Widget? icon;

  //
  //
  //

  const WTextFieldEmailButton({
    this.icon,
    this.emailSubject = "",
    this.emailBody = "",
  });

  //
  //
  //

  @override
  Widget builder(final event) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final url = Uri(
          scheme: "mailto",
          path: event.text,
          queryParameters: {
            "subject": this.emailSubject,
            "body": this.emailBody,
          }.nonNullValues,
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Padding(
        padding: EdgeInsets.all($4),
        child: this.icon ?? WIcon(Icons.email_outlined),
      ),
    );
  }
}
