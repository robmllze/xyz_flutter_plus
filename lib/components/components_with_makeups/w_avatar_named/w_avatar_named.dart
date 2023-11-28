//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_avatar_named_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_AVATAR_NAMED_PARAMETERS = {
  "color": "Color?",
  "diameter": "double?",
  "textStyle": "TextStyle?",
};

@GenerateMakeups(parameters: W_AVATAR_NAMED_PARAMETERS)
class WAvatarNamed extends StatelessWidget {
  //
  //
  //

  final WAvatarNamedMakeup? makeup;
  final String? displayName;
  final bool usePersonalColor;
  final void Function()? onTap;

  //
  //
  //

  const WAvatarNamed({
    Key? key,
    this.makeup,
    this.displayName,
    this.usePersonalColor = true,
    this.onTap,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      onTap: this.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        width: this.makeup?.diameter,
        height: this.makeup?.diameter,
        decoration: BoxDecoration(
          color: this.usePersonalColor
              ? generateAvatarColorFromName(displayName ?? "??")
              : this.makeup?.color,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            _nameToNameCode(this.displayName),
            style: this.makeup?.textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

String _nameToNameCode(String? name) {
  final trimmed = name
      // Filter out all characters not letters or spaces.
      ?.replaceAll(RegExp("[^a-zA-Z ]"), "")
      // Replace all long spaces with single spaces.
      .replaceAll(RegExp(r" {2,}"), " ")
      // Trim left and right.
      .trim();

  // If null or empty.
  if (trimmed == null || trimmed.isEmpty) return "??";

  // Separate words.
  final words = trimmed.split(" ");

  // At this point we know there must be at least one word with one character.
  if (words.length == 1) {
    // If the word is only one character.
    if (words[0].length == 1) return words[0][0].toUpperCase();
    // If the word is more than one character.
    return "${words[0][0]}${words[0][1]}".toUpperCase();
  }

  // At this point we know there must be at least two words.
  return "${words[0][0]}${words[1][0]}".toUpperCase();
}
