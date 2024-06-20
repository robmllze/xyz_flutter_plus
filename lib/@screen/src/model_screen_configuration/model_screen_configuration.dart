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

part '_model_screen_configuration.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateModel(
  shouldInherit: true,
  fields: {
    ('args?', Map<dynamic, dynamic>),
    ('is_accessible_only_if_logged_in_and_verified?', bool),
    ('is_accessible_only_if_logged_in?', bool),
    ('is_accessible_only_if_logged_out?', bool),
    ('is_redirectable?', bool),
    ('path?', String),
    ('previous_configuration?', ModelScreenConfiguration),
    ('title?', String),
  },
)
abstract class _ModelScreenConfiguration extends Model {}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ModelScreenConfigurationExtension on ModelScreenConfiguration {
  T? arg<T>(dynamic key) => letAs<T>(this.args?[key]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Creates a [ModelScreenConfiguration] from the current base URL.
ModelScreenConfiguration currentBaseConfiguration() {
  return ModelScreenConfiguration(
    args: Uri.base.queryParameters,
    path: Uri.base.path,
  );
}

/// Creates a [ModelScreenConfiguration] from a [Uri].
ModelScreenConfiguration urlToScreenConfiguration({
  required Uri url,
  required bool isAccessibleOnlyIfLoggedIn,
  required bool isAccessibleOnlyIfLoggedInAndVerified,
  required bool isAccessibleOnlyIfLoggedOut,
  required bool isRedirectable,
  required String? title,
}) {
  final path = url.path;
  final args = <dynamic, dynamic>{...url.queryParameters};
  for (var n = 0; n < url.pathSegments.length; n++) {
    args[n] = url.pathSegments[n];
  }
  return ModelScreenConfiguration(
    args: args,
    isAccessibleOnlyIfLoggedIn: isAccessibleOnlyIfLoggedIn,
    isAccessibleOnlyIfLoggedInAndVerified:
        isAccessibleOnlyIfLoggedInAndVerified,
    isAccessibleOnlyIfLoggedOut: isAccessibleOnlyIfLoggedOut,
    isRedirectable: isRedirectable,
    path: path,
    title: title,
  );
}
