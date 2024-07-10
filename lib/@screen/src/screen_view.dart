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

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xyz_utils/xyz_utils.dart';

import '/@layout/src/_all_src.g.dart';
import '/@easy_components/src/w_surface.dart';

import '/@screen/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class ScreenView<
        TScreen extends Screen,
        TModelScreenConfiguration extends ModelScreenConfiguration,
        TController extends ScreenController<TModelScreenConfiguration>> extends State<TScreen>
    with AfterFirstLayoutMixin {
  //
  //
  //

  // ---------------------------------------------------------------------------
  // Manage the lifecycle of the screen controller and view.
  // ---------------------------------------------------------------------------

  /// The current ontroller associated with this screen.
  late final TController c;

  @override
  void initState() {
    this._initController();
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
    return (this.widget.createController(this.widget, this)..initController()) as TController;
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
  // Get the sizes of the sides (topSide, bottomSide, leftSide, rightSide) on
  // the first frame rendered.
  // ---------------------------------------------------------------------------

  EdgeInsets _sideInsets = EdgeInsets.zero;
  final _topSideKey = GlobalKey();
  final _bottomSideKey = GlobalKey();
  final _leftSideKey = GlobalKey();
  final _rightSideKey = GlobalKey();
  @override
  void afterFirstLayout(BuildContext context) {
    final topSideBox = this._topSideKey.currentContext?.findRenderObject() as RenderBox;
    final bottomSideBox = this._bottomSideKey.currentContext?.findRenderObject() as RenderBox;
    final leftSideBox = this._leftSideKey.currentContext?.findRenderObject() as RenderBox;
    final rightSideBox = this._rightSideKey.currentContext?.findRenderObject() as RenderBox;
    this._sideInsets = EdgeInsets.only(
      top: topSideBox.size.height,
      bottom: bottomSideBox.size.height,
      left: leftSideBox.size.width,
      right: rightSideBox.size.width,
    );
  }

  // ---------------------------------------------------------------------------
  // Create a display structure for the screen.
  // ---------------------------------------------------------------------------

  /// Do not override. This method invokes the necessary builders and organizes
  /// the screen layout based on the current device.
  @nonVirtual
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final calculator = ScreenCalculator(screenSize.width, screenSize.height);
    final appLayout = AppLayout.fromScreenCalculator(calculator);
    return SafeArea(
      top: false,
      maintainBottomViewPadding: true,
      child: () {
        switch (appLayout) {
          case AppLayout.MOBILE:
            final body1 = this.mobileBody(context);
            final body3 = this._finalBody(context, body1);
            final layout = this.mobileLayout(context, body3);
            return layout;
          case AppLayout.MOBILE_HORIZONTAL:
            final body1 = this.horizontalMobileBody(context);
            final body3 = this._finalBody(context, body1);
            final layout = this.horizontalMobileLayout(context, body3);
            return layout;
          case AppLayout.NARROW:
            final body1 = this.narrowBody(context);
            final body3 = this._finalBody(context, body1);
            final layout = this.narrowLayout(context, body3);
            return layout;
          case AppLayout.WIDE:
            final body1 = this.wideBody(context);
            final body3 = this._finalBody(context, body1);
            final layout = this.wideLayout(context, body3);
            return layout;
          default:
            final body1 = this.body(context);
            final body3 = this._finalBody(context, body1);
            final layout = this.layout(context, body3);
            return layout;
        }
      }(),
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

  /// Override this method to specify the alignment of the [body] within the
  /// layout. Ideal for implementing scroll views. The [sideInsets] are set to
  /// correspond with the dimensions of widgets returned by [topSide],
  /// [bottomSide], [leftSide], and [rightSide].
  Widget bodyAlignment(
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

  /// Override this method to specify the background. This is rendered behind
  /// the body.
  Widget background(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
    );
  }

  /// Override this method to specify the foregound. This is rendered over
  /// the body.
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

  /// Override this method to further define how the main [body] is presented.
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

  Widget bodyWrapper(BuildContext context, Widget body) {
    return body;
  }

  //
  //
  //

  /// Combines all the components into the final body.
  Widget _finalBody(BuildContext context, Widget body1) {
    final topSide = this.topSide(context);
    final bottomSide = this.bottomSide(context);
    final leftSide = this.leftSide(context);
    final rightSide = this.rightSide(context);
    final body2 = Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: this.background(context),
        ),
        this.bodyAlignment(
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
    final body3 = this.bodyWrapper(context, body2);
    return body3;
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
