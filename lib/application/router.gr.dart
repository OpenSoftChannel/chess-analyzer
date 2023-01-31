// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/views/active_game/active_game_view.dart' as _i3;
import '../ui/views/play_timer/play_timer_view.dart' as _i2;
import '../ui/views/setup/setup_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SetupView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SetupView(),
      );
    },
    PlaytimerView.name: (routeData) {
      final args = routeData.argsAs<PlaytimerViewArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.PlaytimerView(
          key: args.key,
          minutes: args.minutes,
          increment: args.increment,
        ),
      );
    },
    ActiveGame.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ActiveGame(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SetupView.name,
          path: '/',
        ),
        _i4.RouteConfig(
          PlaytimerView.name,
          path: '/playtimer-view',
        ),
        _i4.RouteConfig(
          ActiveGame.name,
          path: '/active-game',
        ),
      ];
}

/// generated route for
/// [_i1.SetupView]
class SetupView extends _i4.PageRouteInfo<void> {
  const SetupView()
      : super(
          SetupView.name,
          path: '/',
        );

  static const String name = 'SetupView';
}

/// generated route for
/// [_i2.PlaytimerView]
class PlaytimerView extends _i4.PageRouteInfo<PlaytimerViewArgs> {
  PlaytimerView({
    _i5.Key? key,
    required int minutes,
    required int increment,
  }) : super(
          PlaytimerView.name,
          path: '/playtimer-view',
          args: PlaytimerViewArgs(
            key: key,
            minutes: minutes,
            increment: increment,
          ),
        );

  static const String name = 'PlaytimerView';
}

class PlaytimerViewArgs {
  const PlaytimerViewArgs({
    this.key,
    required this.minutes,
    required this.increment,
  });

  final _i5.Key? key;

  final int minutes;

  final int increment;

  @override
  String toString() {
    return 'PlaytimerViewArgs{key: $key, minutes: $minutes, increment: $increment}';
  }
}

/// generated route for
/// [_i3.ActiveGame]
class ActiveGame extends _i4.PageRouteInfo<void> {
  const ActiveGame()
      : super(
          ActiveGame.name,
          path: '/active-game',
        );

  static const String name = 'ActiveGame';
}
