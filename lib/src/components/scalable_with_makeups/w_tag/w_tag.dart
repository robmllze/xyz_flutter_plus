//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:xyz_gen_annotations/xyz_gen_annotations.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateMakeups(
  properties: {
    'backgroundColor': 'Color?',
    'textStyle': 'TextStyle?',
    'padding': 'EdgeInsets?',
    'margin': 'EdgeInsets?',
    'borderRadius': 'BorderRadius?',
  },
)
class WTag extends StatelessWidget {
  //
  //
  //

  final String text;
  final void Function()? onTap;
  final WTagMakeup? makeup;

  //
  //
  //

  const WTag({
    super.key,
    required this.text,
    this.onTap,
    this.makeup,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: this.makeup?.backgroundColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.25),
          borderRadius: makeup?.borderRadius ?? BorderRadius.circular(4.sc),
        ),
        margin: this.makeup?.margin ?? EdgeInsets.all(4.sc),
        padding: this.makeup?.padding ?? EdgeInsets.all(4.sc),
        child: Text(
          this.text,
          style: this.makeup?.textStyle ?? Theme.of(context).textTheme.bodySmall?.wMedium,
        ),
      ),
    );
  }
}
