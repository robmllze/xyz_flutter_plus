//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class DynamicPalette extends CommonPalette {
  //
  //
  //

  final ColorMixer primaryMixer;
  final ColorMixer secondaryMixer;
  final ColorMixer successMixer;
  final ColorMixer neutralMixer;
  final ColorMixer errorMixer;
  final ColorMixer warningMixer;
  final ColorMixer contrastMixer;

  //
  //
  //

  late final primaryColors = primaryMixer.getPallete();
  late final secondaryColors = secondaryMixer.getPallete();
  late final successColors = successMixer.getPallete();
  late final neutralColors = neutralMixer.getPallete();
  late final errorColors = errorMixer.getPallete();
  late final warningColors = warningMixer.getPallete();
  late final contrastColors = contrastMixer.getPallete();

  //
  //
  //

  DynamicPalette({
    required this.primaryMixer,
    required this.secondaryMixer,
    required this.successMixer,
    required this.neutralMixer,
    required this.errorMixer,
    required this.warningMixer,
    required this.contrastMixer,
  });

  //
  //
  //

  factory DynamicPalette.from(CommonPalette from) {
    return DynamicPalette(
      primaryMixer: BrightnessMixer(baseColor: from.primary),
      secondaryMixer: BrightnessMixer(baseColor: from.secondary),
      successMixer: BrightnessMixer(baseColor: from.success),
      neutralMixer: BrightnessMixer(baseColor: from.neutral),
      errorMixer: BrightnessMixer(baseColor: from.error),
      warningMixer: BrightnessMixer(baseColor: from.warning),
      contrastMixer: BrightnessMixer(baseColor: from.contrast),
    );
  }

  //
  //
  //

  DynamicPalette.pro({
    this.primaryMixer = const BrightnessMixer(baseColor: ExampleFlatColors.wetAsphalt),
    this.secondaryMixer = const BrightnessMixer(baseColor: ExampleFlatColors.belizeHole),
    this.successMixer = const BrightnessMixer(baseColor: ExampleFlatColors.greenSea),
    this.neutralMixer = const BrightnessMixer(baseColor: ExampleFlatColors.asbestos700),
    this.errorMixer = const BrightnessMixer(baseColor: ExampleFlatColors.pomegranate),
    this.warningMixer = const BrightnessMixer(baseColor: ExampleFlatColors.pumpkin),
    this.contrastMixer = const BrightnessMixer(baseColor: ExampleFlatColors.wetAsphalt),
  });

  //
  //
  //

  DynamicPalette.grape({
    this.primaryMixer = const BrightnessMixer(baseColor: ExampleFlatColors.wisteria700),
    this.secondaryMixer = const BrightnessMixer(baseColor: ExampleFlatColors.peterRiver),
    this.successMixer = const BrightnessMixer(baseColor: ExampleFlatColors.emerald),
    this.neutralMixer = const BrightnessMixer(baseColor: Color(0xFF675876)),
    this.errorMixer = const BrightnessMixer(baseColor: ExampleFlatColors.alizarin),
    this.warningMixer = const BrightnessMixer(baseColor: ExampleFlatColors.carrot),
    this.contrastMixer = const BrightnessMixer(baseColor: ExampleFlatColors.wisteria700),
  });

  //
  //
  //

  DynamicPalette copyWith({
    ColorMixer? primaryMixer,
    ColorMixer? secondaryMixer,
    ColorMixer? successMixer,
    ColorMixer? neutralMixer,
    ColorMixer? errorMixer,
    ColorMixer? warningMixer,
    ColorMixer? contrastMixer,
  }) {
    return DynamicPalette(
      primaryMixer: primaryMixer ?? this.primaryMixer,
      secondaryMixer: secondaryMixer ?? this.secondaryMixer,
      successMixer: successMixer ?? this.successMixer,
      neutralMixer: neutralMixer ?? this.neutralMixer,
      errorMixer: errorMixer ?? this.errorMixer,
      warningMixer: warningMixer ?? this.warningMixer,
      contrastMixer: contrastMixer ?? this.contrastMixer,
    );
  }

  //
  //
  //

  DynamicPalette reversed() {
    return DynamicPalette(
      primaryMixer: ReverseMixer(previousMixer: primaryMixer),
      secondaryMixer: ReverseMixer(previousMixer: secondaryMixer),
      successMixer: ReverseMixer(previousMixer: successMixer),
      neutralMixer: ReverseMixer(previousMixer: neutralMixer),
      errorMixer: ReverseMixer(previousMixer: errorMixer),
      warningMixer: ReverseMixer(previousMixer: warningMixer),
      contrastMixer: ReverseMixer(previousMixer: contrastMixer),
    );
  }

  //
  //
  //

  @override
  Color get contrast0 => this.contrastColors[0]!;
  @override
  Color get contrast100 => this.contrastColors[100]!;
  @override
  Color get contrast200 => this.contrastColors[200]!;
  @override
  Color get contrast300 => this.contrastColors[300]!;
  @override
  Color get contrast400 => this.contrastColors[400]!;
  @override
  Color get contrast50 => this.contrastColors[50]!;
  @override
  Color get contrast500 => this.contrastColors[500]!;
  @override
  Color get contrast600 => this.contrastColors[600]!;
  @override
  Color get contrast700 => this.contrastColors[700]!;
  @override
  Color get contrast800 => this.contrastColors[800]!;
  @override
  Color get contrast900 => this.contrastColors[900]!;
  @override
  Color get contrast1000 => this.contrastColors[1000]!;

  //
  //
  //

  @override
  Color get error100 => this.errorColors[100]!;
  @override
  Color get error200 => this.errorColors[200]!;
  @override
  Color get error300 => this.errorColors[300]!;
  @override
  Color get error400 => this.errorColors[400]!;
  @override
  Color get error50 => this.errorColors[50]!;
  @override
  Color get error500 => this.errorColors[500]!;
  @override
  Color get error600 => this.errorColors[600]!;
  @override
  Color get error700 => this.errorColors[700]!;
  @override
  Color get error800 => this.errorColors[800]!;
  @override
  Color get error900 => this.errorColors[900]!;

  //
  //
  //

  @override
  Color get neutral100 => this.neutralColors[100]!;
  @override
  Color get neutral200 => this.neutralColors[200]!;
  @override
  Color get neutral300 => this.neutralColors[300]!;
  @override
  Color get neutral400 => this.neutralColors[400]!;
  @override
  Color get neutral50 => this.neutralColors[50]!;
  @override
  Color get neutral500 => this.neutralColors[500]!;
  @override
  Color get neutral600 => this.neutralColors[600]!;
  @override
  Color get neutral700 => this.neutralColors[700]!;
  @override
  Color get neutral800 => this.neutralColors[800]!;
  @override
  Color get neutral900 => this.neutralColors[900]!;

  //
  //
  //

  @override
  Color get primary100 => this.primaryColors[100]!;
  @override
  Color get primary200 => this.primaryColors[200]!;
  @override
  Color get primary300 => this.primaryColors[300]!;
  @override
  Color get primary400 => this.primaryColors[400]!;
  @override
  Color get primary50 => this.primaryColors[50]!;
  @override
  Color get primary500 => this.primaryColors[500]!;
  @override
  Color get primary600 => this.primaryColors[600]!;
  @override
  Color get primary700 => this.primaryColors[700]!;
  @override
  Color get primary800 => this.primaryColors[800]!;
  @override
  Color get primary900 => this.primaryColors[900]!;

  //
  //
  //

  @override
  Color get secondary100 => this.secondaryColors[100]!;
  @override
  Color get secondary200 => this.secondaryColors[200]!;
  @override
  Color get secondary300 => this.secondaryColors[300]!;
  @override
  Color get secondary400 => this.secondaryColors[400]!;
  @override
  Color get secondary50 => this.secondaryColors[50]!;
  @override
  Color get secondary500 => this.secondaryColors[500]!;
  @override
  Color get secondary600 => this.secondaryColors[600]!;
  @override
  Color get secondary700 => this.secondaryColors[700]!;
  @override
  Color get secondary800 => this.secondaryColors[800]!;
  @override
  Color get secondary900 => this.secondaryColors[900]!;

  //
  //
  //

  @override
  Color get success100 => this.successColors[100]!;
  @override
  Color get success200 => this.successColors[200]!;
  @override
  Color get success300 => this.successColors[300]!;
  @override
  Color get success400 => this.successColors[400]!;
  @override
  Color get success50 => this.successColors[50]!;
  @override
  Color get success500 => this.successColors[500]!;
  @override
  Color get success600 => this.successColors[600]!;
  @override
  Color get success700 => this.successColors[700]!;
  @override
  Color get success800 => this.successColors[800]!;
  @override
  Color get success900 => this.successColors[900]!;

  //
  //
  //

  @override
  Color get warning100 => this.warningColors[100]!;
  @override
  Color get warning200 => this.warningColors[200]!;
  @override
  Color get warning300 => this.warningColors[300]!;
  @override
  Color get warning400 => this.warningColors[400]!;
  @override
  Color get warning50 => this.warningColors[50]!;
  @override
  Color get warning500 => this.warningColors[500]!;
  @override
  Color get warning600 => this.warningColors[600]!;
  @override
  Color get warning700 => this.warningColors[700]!;
  @override
  Color get warning800 => this.warningColors[800]!;
  @override
  Color get warning900 => this.warningColors[900]!;
}