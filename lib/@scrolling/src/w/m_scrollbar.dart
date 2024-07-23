//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _kScrollbarThickness = 8.0;
const _kScrollbarThicknessWithTrack = 12.0;
const _kScrollbarMargin = 2.0;
const _kScrollbarMinLength = 48.0;
const _kScrollbarRadius = Radius.circular(8.0);
const _kScrollbarFadeDuration = Duration(milliseconds: 300);
const _kScrollbarTimeToFade = Duration(milliseconds: 600);
const _kScrollbarStyle = MScrollbarStyle();

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Integrate this style with WScrolalbleMakeup
class MScrollbarStyle {
  //
  //
  //

  final double hoverThickness;
  final double thickness;
  final Radius radius;
  final Color? color;

  //
  //
  //

  const MScrollbarStyle({
    this.radius = _kScrollbarRadius,
    this.thickness = _kScrollbarThickness,
    this.hoverThickness = _kScrollbarThicknessWithTrack,
    this.color,
  });
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MScrollbar extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final bool? showTrackOnHover;
  final MScrollbarStyle style;
  final ScrollNotificationPredicate? notificationPredicate;
  final Duration? scrollbarTimeToFade;
  final Duration? scrollbarFadeDuration;

  //
  //
  //

  const MScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.style = _kScrollbarStyle,
    this.scrollbarFadeDuration,
    this.scrollbarTimeToFade,
    this.thumbVisibility,
    this.showTrackOnHover,
    this.notificationPredicate,
  });

  //
  //
  //

  @override
  _MScrollbarState createState() => _MScrollbarState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _MScrollbarState extends State<MScrollbar> {
  @override
  Widget build(BuildContext context) {
    return _Scrollbar(
      controller: this.widget.controller,
      thumbVisibility: this.widget.thumbVisibility,
      showTrackOnHover: this.widget.showTrackOnHover,
      hoverThickness: this.widget.style.hoverThickness,
      thickness: this.widget.style.thickness,
      radius: this.widget.style.radius,
      color: this.widget.style.color,
      notificationPredicate: this.widget.notificationPredicate,
      child: this.widget.child,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _Scrollbar extends RawScrollbar {
  //
  //
  //

  final Duration? scrollbarTimeToFade;
  final Duration? scrollbarFadeDuration;
  final Color? color;
  final bool? showTrackOnHover;
  final double? hoverThickness;

  //
  //
  //

  const _Scrollbar({
    required super.child,
    super.controller,
    super.thumbVisibility,
    this.showTrackOnHover,
    this.hoverThickness,
    this.color,
    this.scrollbarFadeDuration,
    this.scrollbarTimeToFade,
    super.thickness,
    super.radius,
    ScrollNotificationPredicate? notificationPredicate,
  }) : super(
          fadeDuration: scrollbarFadeDuration ?? _kScrollbarFadeDuration,
          timeToFade: scrollbarTimeToFade ?? _kScrollbarTimeToFade,
          pressDuration: Duration.zero,
          notificationPredicate: notificationPredicate ?? defaultScrollNotificationPredicate,
        );

  //
  //
  //

  @override
  _ScrollbarState createState() => _ScrollbarState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ScrollbarState extends RawScrollbarState<_Scrollbar> {
  //
  //
  //

  late AnimationController _hoverAnimationController;
  bool _dragIsActive = false;
  bool _hoverIsActive = false;
  late ColorScheme _colorScheme;
  late ScrollbarThemeData _scrollbarTheme;
  late bool _useAndroidScrollbar;

  //
  //
  //

  @override
  bool get showScrollbar {
    return this.widget.thumbVisibility ??
        this._scrollbarTheme.thumbVisibility?.resolve({}) ??
        false;
  }

  //
  //
  //

  bool get _showTrackOnHover {
    return this.widget.showTrackOnHover ??
        this._scrollbarTheme.trackVisibility?.resolve({}) ??
        false;
  }

  //
  //
  //

  Set<WidgetState> get _states => <WidgetState>{
        if (this._dragIsActive) WidgetState.dragged,
        if (this._hoverIsActive) WidgetState.hovered,
      };

  //
  //
  //

  WidgetStateProperty<Color> get _thumbColor {
    final onSurface = this.widget.color ?? this._colorScheme.onSurface;
    late Color dragColor;
    late Color hoverColor;
    late Color idleColor;
    dragColor = onSurface.withOpacity(0.9);
    hoverColor = onSurface.withOpacity(0.75);
    idleColor = onSurface.withOpacity(0.5);

    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.dragged)) {
        return this._scrollbarTheme.thumbColor?.resolve(states) ?? dragColor;
      }
      if (states.contains(WidgetState.hovered) && _showTrackOnHover) {
        return this._scrollbarTheme.thumbColor?.resolve(states) ?? hoverColor;
      }
      return Color.lerp(
        this._scrollbarTheme.thumbColor?.resolve(states) ?? idleColor,
        this._scrollbarTheme.thumbColor?.resolve(states) ?? hoverColor,
        this._hoverAnimationController.value,
      )!;
    });
  }

  //
  //
  //

  WidgetStateProperty<Color> get _trackColor {
    final onSurface = this.widget.color ?? _colorScheme.onSurface;

    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered) && this._showTrackOnHover) {
        return this._scrollbarTheme.trackColor?.resolve(states) ?? onSurface.withOpacity(0.05);
      }
      return const Color(0x00000000);
    });
  }

  //
  //
  //

  WidgetStateProperty<Color> get _trackBorderColor {
    final onSurface = this.widget.color ?? _colorScheme.onSurface;

    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered) && this._showTrackOnHover) {
        return this._scrollbarTheme.trackBorderColor?.resolve(states) ?? onSurface.withOpacity(0.1);
      }
      return const Color(0x00000000);
    });
  }

  //
  //
  //

  WidgetStateProperty<double> get _thickness {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered) && this._showTrackOnHover) {
        return this.widget.hoverThickness ??
            this._scrollbarTheme.thickness?.resolve(states) ??
            _kScrollbarThicknessWithTrack;
      }
      return this.widget.thickness ??
          this._scrollbarTheme.thickness?.resolve(states) ??
          (_kScrollbarThickness / (this._useAndroidScrollbar ? 2 : 1));
    });
  }

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._hoverAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    this._hoverAnimationController.addListener(() {
      updateScrollbarPainter();
    });
  }

  //
  //
  //

  @override
  void didChangeDependencies() {
    final theme = Theme.of(context);
    this._colorScheme = theme.colorScheme;
    this._scrollbarTheme = theme.scrollbarTheme;
    switch (theme.platform) {
      case TargetPlatform.android:
        this._useAndroidScrollbar = true;
        break;
      default:
        this._useAndroidScrollbar = false;
        break;
    }
    super.didChangeDependencies();
  }

  //
  //
  //

  @override
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = this._thumbColor.resolve(_states)
      ..trackColor = this._trackColor.resolve(_states)
      ..trackBorderColor = this._trackBorderColor.resolve(_states)
      ..textDirection = Directionality.of(context)
      ..thickness = this._thickness.resolve(_states)
      ..radius = this.widget.radius ??
          this._scrollbarTheme.radius ??
          (this._useAndroidScrollbar ? null : _kScrollbarRadius)
      ..crossAxisMargin = this._scrollbarTheme.crossAxisMargin ??
          (this._useAndroidScrollbar ? 0.0 : _kScrollbarMargin)
      ..mainAxisMargin = this._scrollbarTheme.mainAxisMargin ?? 0.0
      ..minLength = _scrollbarTheme.minThumbLength ?? _kScrollbarMinLength
      ..padding = MediaQuery.of(context).padding;
  }

  //
  //
  //

  @override
  void handleThumbPressStart(Offset localPosition) {
    super.handleThumbPressStart(localPosition);
    this.setState(() {
      this._dragIsActive = true;
    });
  }

  //
  //
  //

  @override
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    super.handleThumbPressEnd(localPosition, velocity);
    this.setState(() {
      this._dragIsActive = false;
    });
  }

  //
  //
  //

  @override
  void handleHover(PointerHoverEvent event) {
    super.handleHover(event);
    if (isPointerOverScrollbar(event.position, event.kind)) {
      this.setState(() {
        this._hoverIsActive = true;
      });
      this._hoverAnimationController.forward();
    } else if (this._hoverIsActive) {
      this.setState(() {
        this._hoverIsActive = false;
      });
      this._hoverAnimationController.reverse();
    }
  }

  //
  //
  //

  @override
  void handleHoverExit(PointerExitEvent event) {
    super.handleHoverExit(event);
    this.setState(() {
      this._hoverIsActive = false;
    });
    this._hoverAnimationController.reverse();
  }

  //
  //
  //

  @override
  void dispose() {
    this._hoverAnimationController.dispose();
    super.dispose();
  }
}
