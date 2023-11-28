//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

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
    Key? key,
    this.text,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 0.5.scaled,
            color: text?.style?.color,
          ),
        ),
        if (this.text != null) ...[
          SizedBox(width: $12),
          this.text!,
          SizedBox(width: $12),
          Expanded(
            child: Divider(
              height: 0.5.scaled,
              color: text?.style?.color,
            ),
          ),
        ],
      ],
    );
  }
}
