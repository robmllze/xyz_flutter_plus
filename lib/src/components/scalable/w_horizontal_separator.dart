//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WHorizontalSeparator extends StatelessWidget {
  //
  //
  //

  final Text? text;

  //
  //
  //

  const WHorizontalSeparator({
    super.key,
    this.text,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 0.5.sc,
            color: text?.style?.color,
          ),
        ),
        if (this.text != null) ...[
          SizedBox(width: 12.sc),
          this.text!,
          SizedBox(width: 12.sc),
          Expanded(
            child: Divider(
              height: 0.5.sc,
              color: text?.style?.color,
            ),
          ),
        ],
      ],
    );
  }
}
