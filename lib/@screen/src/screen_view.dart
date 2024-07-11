//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xyz_utils/xyz_utils.dart';

import '/@utils/src/capture_widget.dart';
import '/@app_properties/src/app_scale.dart';
import '/@easy_components/src/w_surface.dart';
import '/@screen/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class ScreenView<
        TScreen extends Screen,
        TModelScreenConfiguration extends ModelScreenConfiguration,
        TController extends ScreenController<TModelScreenConfiguration>>
    extends State<TScreen> with AfterLayoutMixin {
  //
  //
  //

  // ---------------------------------------------------------------------------

  /// The current ontroller associated with this screen.
  late final TController c;

  @override
  void initState() {
    this._initController();
    this._initScreenCapture();
    super.initState();
  }

  void _initController() {
    final key = this.widget.key;
    // If the key is null, just create a new current controller.
    if (key == null) {
      this.c = this._createController();
    } else
    // If the key is not null, only create a new controller if one for the key
    //  does not already exist.
    {
      // If no controller already exist in the cache, set one up.
      if (_controllerCache[key] == null) {
        final controllerTimeout = this.widget.controllerCacheTimeout;
        _controllerCache[key] = _ControllerCache(
          controller: this._createController(),
          // If a timeout is specified, set up a debouncer to dispose of the
          //controller once the screen is disposed and after the timeout.
          debouncer: controllerTimeout != null
              ? Debouncer(
                  delay: controllerTimeout,
                  onWaited: () {
                    this.c.dispose();
                    _controllerCache.remove(this.widget.key);
                  },
                )
              : null,
        );
      } else {
        // Reset the debouncer so that the controller will again only time out
        // after the screen is disposed and after the timeout.
        _controllerCache[key]?.debouncer?.cancel();
      }
      // Assign the current controller from the cache.
      this.c = _controllerCache[key]?.controller as TController;
    }
  }

  /// Creates a new instance of [TController] from the current widget.
  TController _createController() {
    return (this.widget.createController(this.widget, this)..initController())
        as TController;
  }

  /// Stores all active controllers.
  static final _controllerCache = <Key, _ControllerCache>{};

  @mustCallSuper
  @override
  void dispose() async {
    // Call the debouncer to trigger the disposal of the controller after the
    // timeout.
    final key = this.widget.key;
    if (key != null) {
      _controllerCache[key]?.debouncer?.call();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Provide screen capturing functionality.
  // ---------------------------------------------------------------------------

  final _buildCaptureKey = GlobalKey();
  final _bodyCaptureKey = GlobalKey();

  static GlobalKey? _staticBuildCaptureKey;
  static GlobalKey? _staticBody3CaptureKey;

  static Widget? buildCapture;
  static Widget? bodyCapture;

  static Future<({Widget buildCapture, Widget body3Captrue})?>
      captureScreen() async {
    try {
      buildCapture = await captureWidget(_staticBuildCaptureKey!);
      bodyCapture = await captureWidget(_staticBody3CaptureKey!);
      return (
        buildCapture: buildCapture!,
        body3Captrue: bodyCapture!,
      );
    } catch (_) {
      return null;
    }
  }

  void _initScreenCapture() {
    _staticBuildCaptureKey = this._buildCaptureKey;
    _staticBody3CaptureKey = this._bodyCaptureKey;
  }

  // ---------------------------------------------------------------------------
  // Get the sizes of the sides (topSide, bottomSide, leftSide, rightSide) on
  // the first frame rendered.
  // ---------------------------------------------------------------------------

  bool _didCalculateSideInsets = false;

  EdgeInsets _sideInsets = EdgeInsets.zero;

  final _topSideKey = GlobalKey();
  final _bottomSideKey = GlobalKey();
  final _leftSideKey = GlobalKey();
  final _rightSideKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final topSideBox =
        this._topSideKey.currentContext?.findRenderObject() as RenderBox;
    final bottomSideBox =
        this._bottomSideKey.currentContext?.findRenderObject() as RenderBox;
    final leftSideBox =
        this._leftSideKey.currentContext?.findRenderObject() as RenderBox;
    final rightSideBox =
        this._rightSideKey.currentContext?.findRenderObject() as RenderBox;
    this.setState(() {
      this._sideInsets = EdgeInsets.only(
        top: topSideBox.size.height,
        bottom: bottomSideBox.size.height,
        left: leftSideBox.size.width,
        right: rightSideBox.size.width,
      );
      this._didCalculateSideInsets = true;
    });
  }

  // ---------------------------------------------------------------------------
  // Create a display structure for the screen.
  // ---------------------------------------------------------------------------

  /// Do not override. This method invokes the necessary builders and organizes
  /// the screen layout based on the current device.
  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (buildCapture != null) buildCapture!,
        Offstage(
          offstage: !this._didCalculateSideInsets,
          child: RepaintBoundary(
            key: this._buildCaptureKey,
            child: SafeArea(
              top: false,
              maintainBottomViewPadding: true,
              child: () {
                final screenSize = MediaQuery.of(context).size;
                final calculator =
                    ScreenCalculator(screenSize.width, screenSize.height);
                final appLayout = AppLayout.fromScreenCalculator(calculator);
                switch (appLayout) {
                  case AppLayout.MOBILE:
                    final body0 = this.mobileBody(context);
                    final body5 = this._final(context, body0);
                    final layout = this.mobileLayout(context, body5);
                    return layout;
                  case AppLayout.MOBILE_HORIZONTAL:
                    final body0 = this.horizontalMobileBody(context);
                    final body5 = this._final(context, body0);
                    final layout = this.horizontalMobileLayout(context, body5);
                    return layout;
                  case AppLayout.NARROW:
                    final body0 = this.narrowBody(context);
                    final body5 = this._final(context, body0);
                    final layout = this.narrowLayout(context, body5);
                    return layout;
                  case AppLayout.WIDE:
                    final body0 = this.wideBody(context);
                    final body5 = this._final(context, body0);
                    final layout = this.wideLayout(context, body5);
                    return layout;
                  default:
                    final body0 = this.body(context);
                    final body5 = this._final(context, body0);
                    final layout = this.layout(context, body5);
                    return layout;
                }
              }(),
            ),
          ),
        ),
      ],
    );
  }

  //
  //
  //

  /// Activates for mobile device screen sizes. Override to customize the
  /// layout for these sizes. The [body] includes the widget returned by
  /// [mobileLayout].
  Widget mobileLayout(BuildContext context, Widget body) {
    return this.narrowLayout(context, body);
  }

  /// Activates for mobile device screen sizes ith a horizontal orientation.
  /// Override to customize the layout for these sizes. The [body] includes the
  /// widget returned by [horizontalMobileBody].
  Widget horizontalMobileLayout(BuildContext context, Widget body) {
    return this.wideLayout(context, body);
  }

  /// Activates for non-mobile narrow screen sizes, such as a narrow desktop
  /// window or screen. Override to customize the layout for these sizes. The
  /// [body] includes the widget returned by [narrowBody].
  Widget narrowLayout(BuildContext context, Widget body) {
    return this.layout(context, body);
  }

  /// Activates for non-mobile wide screen sizes, such as a wide desktop
  /// window or screen. Override to customize the layout for these sizes. The
  /// [body] includes the widget returned by [wideBody].
  Widget wideLayout(BuildContext context, Widget body) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxHeight / MIN_MOBILE_ASPECT_RATIO,
                maxHeight: double.infinity,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: WSurface(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.transparent,
                  child: this.layout(context, body),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Activates for screen sizes that do not match the criteria for
  /// [mobileLayout], [horizontalMobileLayout], [narrowLayout], or [wideLayout].
  /// Override to customize these sizes. The [body] includes the widget returned
  /// by [this.body].
  Widget layout(BuildContext context, Widget body) {
    return body;
  }

  //
  //
  //

  /// Activates for mobile device screen sizes. Override to customize the  body
  /// for these sizes.
  Widget mobileBody(BuildContext context) {
    return this.narrowBody(context);
  }

  /// Activates for mobile device screen sizes ith a horizontal orientation.
  /// Override to customize the  body for these sizes.
  Widget horizontalMobileBody(BuildContext context) {
    return this.wideBody(context);
  }

  /// Activates for non-mobile narrow screen sizes, such as a narrow desktop
  /// window or screen. Override to customize the  body for these sizes.
  Widget narrowBody(BuildContext context) {
    return this.body(context);
  }

  /// Activates for non-mobile wide screen sizes, such as a wide desktop
  /// window or screen. Override to customize the body for these sizes.
  Widget wideBody(BuildContext context) {
    return this.body(context);
  }

  /// Activates for screen sizes that do not match the criteria for
  /// [mobileLayout], [horizontalMobileLayout], [narrowLayout], or [wideLayout].
  /// Override to customize the body for these sizes.
  @visibleForOverriding
  Widget body(BuildContext context) {
    return const SizedBox.shrink();
  }

  //
  //
  //

  /// Override to specify the alignment of the [body] within the layout. Ideal
  /// for implementing scroll views. The [sideInsets] are set to correspond
  /// with the dimensions of widgets returned by [topSide], [bottomSide],
  /// [leftSide], and [rightSide].
  Widget align(
    BuildContext context,
    Widget body,
    EdgeInsets sideInsets,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: sideInsets,
          child: body,
        ),
      ),
    );
  }

  //
  //
  //

  /// Override to specify the padding for the body.
  EdgeInsets padding() {
    return EdgeInsets.only(
      left: 40.sc,
      right: 40.sc,
      top: 60.sc,
      bottom: 80.sc,
    );
  }

  //
  //
  //

  /// Override to specify the background. This is rendered behind the body.
  Widget background(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
    );
  }

  /// Override to specify the foregound. This is rendered over the body.
  ///
  /// Tip: Use an [IgnorePointer] when creating non-interactive overlays.
  Widget foreground(BuildContext context) {
    return const IgnorePointer(
      child: SizedBox.expand(),
    );
  }

  //
  //
  //

  /// Override to customize the top area of your screen.
  ///
  /// Tip: Ideal for placing elements like headers.
  Widget topSide(BuildContext context) {
    return const SizedBox.shrink();
  }

  /// Override to customize the bottom area of your screen.
  ///
  /// Tip: Ideal for placing elements like navigation controls.
  Widget bottomSide(BuildContext context) {
    return const SizedBox.shrink();
  }

  //// Override to customize the left area of your screen.
  ///
  /// Tip: Ideal for placing elements like menus and side panels.
  Widget leftSide(BuildContext context) {
    return const SizedBox.shrink();
  }

  //// Override to customize the right area of your screen.
  ///
  /// Tip: Ideal for placing elements like menus and side panels.
  Widget rightSide(BuildContext context) {
    return const SizedBox.shrink();
  }

  //
  //
  //

  /// Override to further define how the main [body] is presented.
  ///
  /// Tip: This is useful for showing or hiding the body content from the
  /// user or displaying loading indicators while the body content is being
  /// loaded.
  ///
  /// **Example:**
  ///
  /// ```dart
  /// @override
  /// Widget bodyWrapper(BuildContext context, Widget body) {
  ///   return PodBuilder(
  ///     pod: this._pIsLoading,
  ///     builder: (context, child, isLoading) {
  ///       if (isLoading) {
  ///         return CircularProgressIndicator();
  ///       } else {
  ///         return child;
  ///       }
  ///     },
  ///     child: body,
  ///   );
  /// }
  /// ```

  Widget presentation(BuildContext context, Widget body) {
    return body;
  }

  //
  //
  //

  /// Override to define how to transition from [prevScreenBody] to
  /// [currentScreenBody].
  ///
  /// **Example 1:**
  /// ```dart
  /// // Render the previous screen capture underneath the current screen.
  /// @override
  /// Widget bodyTransition(Widget? prevScreenBodyCapture, Widget currentScreenBody) {
  ///  return Stack(
  ///    children: [
  ///      if (prevScreenBodyCapture != null) prevScreenBodyCapture,
  ///      currentScreenBody,
  ///    ],
  ///  );
  /// }
  /// ```
  ///
  /// **Example 2:**
  /// ```dart
  /// // Fade from the previous screen capture into the current screen.
  /// @override
  /// Widget bodyTransition(Widget? prevScreenBodyCapture, Widget currentScreenBody) {
  ///   return WAnimatedFade(
  ///     layer1: prevScreenBodyCapture,
  ///     layer2: currentScreenBody,
  ///   );
  /// }
  /// ```
  Widget transition(Widget? prevScreenBodyCapture, Widget currentScreenBody) {
    return Stack(
      children: [
        if (prevScreenBodyCapture != null) prevScreenBodyCapture,
        currentScreenBody,
      ],
    );
  }

  //
  //
  //

  /// Combines all the components into the final body.
  Widget _final(BuildContext context, Widget body0) {
    final topSide = this.topSide(context);
    final bottomSide = this.bottomSide(context);
    final leftSide = this.leftSide(context);
    final rightSide = this.rightSide(context);
    final body1 = Padding(
      padding: this.padding(),
      child: body0,
    );
    final body2 = Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: this.background(context),
        ),
        this.align(
          context,
          body1,
          this._sideInsets,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            key: this._topSideKey,
            child: topSide,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            key: this._bottomSideKey,
            child: bottomSide,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            key: this._leftSideKey,
            child: leftSide,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            key: this._rightSideKey,
            child: rightSide,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: this.foreground(context),
        ),
      ],
    );
    final body3 = this.presentation(context, body2);
    final body4 = Offstage(
      offstage: !this._didCalculateSideInsets,
      child: RepaintBoundary(
        key: this._bodyCaptureKey,
        child: body3,
      ),
    );
    final body5 = this.transition(bodyCapture, body4);
    return body5;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ControllerCache {
  //
  //
  //

  final ScreenController controller;
  final Debouncer? debouncer;

  //
  //
  //

  const _ControllerCache({
    required this.controller,
    required this.debouncer,
  });
}
