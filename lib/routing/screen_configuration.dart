//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:equatable/equatable.dart';

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


class ScreenConfiguration extends Equatable {
  //
  //
  //

  final Map<dynamic, dynamic> arguments;
  final String path;
  final bool? isAccessibleOnlyIfLoggedInAndVerified;
  final bool? isAccessibleOnlyIfLoggedIn;
  final bool? isAccessibleOnlyIfLoggedOut;
  final bool? isRedirectable;

  //
  //
  //

  const ScreenConfiguration({
    this.arguments = const {},
    this.path = "",
    this.isAccessibleOnlyIfLoggedInAndVerified,
    this.isAccessibleOnlyIfLoggedIn,
    this.isAccessibleOnlyIfLoggedOut,
    this.isRedirectable,
  });

  //
  //
  //

  factory ScreenConfiguration.fromUri(
    Uri url, {
    bool? isAccessibleOnlyIfLoggedInAndVerified,
    bool? isAccessibleOnlyIfLoggedIn,
    bool? isAccessibleOnlyIfLoggedOut,
    bool? isRedirectable,
  }) {
    final path = url.path;
    final parameters = <dynamic, dynamic>{...url.queryParameters};
    for (var n = 0; n < url.pathSegments.length; n++) {
      parameters[n] = url.pathSegments[n];
    }
    return ScreenConfiguration(
      arguments: parameters,
      path: path,
      isAccessibleOnlyIfLoggedInAndVerified: isAccessibleOnlyIfLoggedInAndVerified,
      isAccessibleOnlyIfLoggedIn: isAccessibleOnlyIfLoggedIn,
      isAccessibleOnlyIfLoggedOut: isAccessibleOnlyIfLoggedOut,
      isRedirectable: isRedirectable,
    );
  }

  //
  //
  //

  ScreenConfiguration copyWith({
    Map<dynamic, dynamic>? parameters,
    String? path,
    bool? isAccessibleOnlyIfLoggedInAndVerified,
    bool? isAccessibleOnlyIfLoggedIn,
    bool? isAccessibleOnlyIfLoggedOut,
    bool? isRedirectable,
  }) {
    return ScreenConfiguration(
      arguments: (parameters ?? this.arguments).map((k, v) => MapEntry(k.toString(), v)),
      path: path ?? this.path,
      isAccessibleOnlyIfLoggedInAndVerified:
          isAccessibleOnlyIfLoggedInAndVerified ?? this.isAccessibleOnlyIfLoggedInAndVerified,
      isAccessibleOnlyIfLoggedIn: isAccessibleOnlyIfLoggedIn ?? this.isAccessibleOnlyIfLoggedIn,
      isAccessibleOnlyIfLoggedOut: isAccessibleOnlyIfLoggedOut ?? this.isAccessibleOnlyIfLoggedOut,
      isRedirectable: isRedirectable ?? this.isRedirectable,
    );
  }

  //
  //
  //

  @override
  List<Object?> get props => [
        this.arguments,
        this.path,
        this.isAccessibleOnlyIfLoggedInAndVerified,
        this.isAccessibleOnlyIfLoggedIn,
        this.isAccessibleOnlyIfLoggedOut,
        this.isRedirectable,
      ];

  //
  //
  //

  T? arg<T>(dynamic key) => let<T>(this.arguments[key]);
}
