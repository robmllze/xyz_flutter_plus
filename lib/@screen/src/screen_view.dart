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

import '/@app_properties/src/_all_src.g.dart';
import '/@easy_components/src/w_surface.dart';

import '/@screen/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class ScreenView<
        TScreen extends Screen,
        TModelScreenConfiguration extends ModelScreenConfiguration,
        TController extends ScreenController<TModelScreenConfiguration>>
    extends State<TScreen> {
  //
  //
  //

  static final _controllerCache = <Key, _ControllerCache>{};

  //
  //
  //

  late TController c;
  TController get screenController => this.c;

  //
  //
  //

  @override
  void initState() {
    this._initController();
    super.initState();
  }

  //
  //
  //

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
            return this.mobileLayout(
              context,
              this._layoutWrapper(
                context,
                this.mobileBody(context),
              ),
            );
          case AppLayout.MOBILE_HORIZONTAL:
            return this.horizontalMobileLayout(
              context,
              this._layoutWrapper(
                context,
                this.horizontalMobileBody(context),
              ),
            );
          case AppLayout.NARROW:
            return this.narrowLayout(
              context,
              this._layoutWrapper(
                context,
                this.narrowBody(context),
              ),
            );
          case AppLayout.WIDE:
            return this.wideLayout(
              context,
              this._layoutWrapper(
                context,
                this.wideBody(context),
              ),
            );
          default:
            return this.layout(
              context,
              this._layoutWrapper(
                context,
                this.body(context),
              ),
            );
        }
      }(),
    );
  }

  //
  //
  //

  Widget view(
    BuildContext context,
    Widget body,
    EdgeInsets padding,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }

  //
  //
  //

  EdgeInsets viewPadding() {
    return EdgeInsets.only(
      top: 140.sc,
      bottom: 140.sc,
      left: 20.sc,
      right: 20.sc,
    );
  }

  //
  //
  //

  Widget background(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
    );
  }

  //
  //
  //

  Widget foreground(BuildContext context) {
    return const IgnorePointer(
      child: SizedBox.expand(),
    );
  }

  //
  //
  //

  Widget mobileLayout(BuildContext context, Widget body) =>
      this.narrowLayout(context, body);

  Widget horizontalMobileLayout(BuildContext context, Widget body) =>
      this.wideLayout(context, body);

  Widget narrowLayout(BuildContext context, Widget body) =>
      this.layout(context, body);

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

  Widget layout(BuildContext context, Widget body) => body;

  //
  //
  //

  Widget _layoutWrapper(BuildContext context, Widget body) {
    final top = this.top(context);
    final bottom = this.bottom(context);
    final left = this.left(context);
    final right = this.right(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: this.background(context),
        ),
        this.view(
          context,
          body,
          this.viewPadding(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: top,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottom,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: left,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: right,
        ),
        Align(
          alignment: Alignment.center,
          child: this.foreground(context),
        ),
      ],
    );
  }

  //
  //
  //

  Widget mobileBody(BuildContext context) => this.narrowBody(context);

  Widget horizontalMobileBody(BuildContext context) => this.wideBody(context);

  Widget narrowBody(BuildContext context) => this.body(context);

  Widget wideBody(BuildContext context) => this.body(context);

  @visibleForOverriding
  Widget body(BuildContext context) => const SizedBox.shrink();

  //
  //
  //

  Widget top(BuildContext context) => const SizedBox.shrink();

  Widget bottom(BuildContext context) => const SizedBox.shrink();

  Widget left(BuildContext context) => const SizedBox.shrink();

  Widget right(BuildContext context) => const SizedBox.shrink();

  //
  //
  //

  void _initController() {
    final key = this.widget.key;
    final controllerTimeout = this.widget.controllerCacheTimeout;
    if (key != null) {
      if (_controllerCache[key] == null) {
        _controllerCache[key] = _ControllerCache(
          (this.widget.createController(this.widget, this)..initController())
              as TController,
          controllerTimeout != null
              ? Debouncer(
                  delay: controllerTimeout,
                  onWaited: () {
                    this.c.dispose();
                    _controllerCache.remove(this.widget.key);
                  },
                )
              : null,
        );
      }
      this.c = _controllerCache[key]?.controller as TController;
      _controllerCache[key]?.debouncer?.cancel();
    } else {
      this.c = (this.widget.createController(this.widget, this)
        ..initController()) as TController;
    }
  }

  //
  //
  //

  @mustCallSuper
  @override
  void dispose() async {
    _controllerCache[this.widget.key]?.debouncer?.call();
    super.dispose();
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

  const _ControllerCache(
    this.controller,
    this.debouncer,
  );
}
