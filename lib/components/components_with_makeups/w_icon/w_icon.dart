//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter_svg/svg.dart';

import '/all.dart';

part '_w_icon_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_ICON_PARAMETERS = {
  "icon": "IconData?",
  "color": "Color?",
  "size": "double?",
  "decoration": "BoxDecoration?",
};

@GenerateMakeups(parameters: W_ICON_PARAMETERS)
class WIcon extends StatelessWidget {
  //
  //
  //

  final WIconMakeup? makeup;
  late final Widget icon;

  //
  //
  //

  WIcon.fromAssetImageSvg(
    String assetPath, {
    Key? key,
    this.makeup,
  }) : super(key: key) {
    this.icon = this.makeup?.icon != null
        ? Icon(
            this.makeup?.icon,
            color: this.makeup?.color,
          )
        : SvgPicture.asset(
            assetPath,
            theme: SvgTheme(
              currentColor: this.makeup?.color ?? Colors.black,
            ),
          );
  }

  //
  //
  //

  WIcon.fromAssetImage(
    String assetPath, {
    Key? key,
    this.makeup,
  }) : super(key: key) {
    this.icon = this.makeup?.icon != null
        ? Icon(
            this.makeup?.icon,
            color: this.makeup?.color,
          )
        : Image.asset(
            assetPath,
            color: this.makeup?.color,
          );
  }

  //
  //
  //

  WIcon.fromNetworkImage(
    String url, {
    WIcon Function(BuildContext)? placeholderBuilderLoading,
    WIcon Function(BuildContext)? placeholderBuilderError,
    Key? key,
    required this.makeup,
  }) : super(key: key) {
    this.icon = this.makeup?.icon != null
        ? Icon(
            this.makeup?.icon,
            color: this.makeup?.color,
          )
        : Image.network(
            url,
            color: this.makeup?.color,
            loadingBuilder: placeholderBuilderLoading != null
                ? (final context, _, ___) {
                    return placeholderBuilderLoading(context);
                  }
                : null,
            errorBuilder: placeholderBuilderError != null
                ? (final context, _, ___) {
                    return placeholderBuilderError(context);
                  }
                : null,
          );
  }

  //
  //
  //

  WIcon(
    IconData icon, {
    Key? key,
    this.makeup,
  }) : super(key: key) {
    this.icon = Icon(
      this.makeup?.icon ?? icon,
      color: this.makeup?.color,
    );
  }

  //
  //
  //

  // Must add the arg --no-tree-shake-icons to use custom icons.
  WIcon.fromIconCodePoint(
    int codePoint, {
    Key? key,
    String fontFamily = "MaterialIcons",
    required this.makeup,
  }) : super(key: key) {
    this.icon = this.makeup?.icon != null
        ? Icon(
            this.makeup?.icon,
            color: this.makeup?.color,
          )
        : Icon(
            IconData(codePoint, fontFamily: fontFamily),
            color: this.makeup?.color,
          );
  }

  //
  //
  //

  @override
  Widget build(_) {
    return Container(
      width: this.makeup?.size,
      height: this.makeup?.size,
      decoration: this.makeup?.decoration,
      clipBehavior: Clip.hardEdge,
      child: FittedBox(
        fit: BoxFit.fill,
        child: this.icon,
      ),
    );
  }
}
