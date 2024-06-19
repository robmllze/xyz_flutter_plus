//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ImageBuilder {
  //
  //
  //

  final String path;
  final String key;
  final dynamic Function(ImageProvider) builder;

  //
  //
  //

  const ImageBuilder._(
    this.path, {
    String? key,
    required this.builder,
  }) : this.key = key ?? path;

  //
  //
  //

  factory ImageBuilder(
    String path, {
    String? key,
    BoxFit fit = BoxFit.cover,
    bool networkImage = false,
    bool isAntiAlias = true,
    FilterQuality filterQuality = FilterQuality.medium,
  }) {
    return ImageBuilder._(
      path,
      key: key,
      builder: (image) => networkImage
          ? Image.network(
              path,
              fit: fit,
              isAntiAlias: isAntiAlias,
              filterQuality: filterQuality,
            )
          : Image(
              image: image,
              fit: fit,
              isAntiAlias: isAntiAlias,
              filterQuality: filterQuality,
            ),
    );
  }
}
