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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/views/active_game/active_game_view.dart' as _i3;
import '../ui/views/analysis_board/analysis_board_view.dart' as _i4;
import '../ui/views/play_timer/play_timer_view.dart' as _i2;
import '../ui/views/setup/setup_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SetupView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SetupView(),
      );
    },
    PlaytimerView.name: (routeData) {
      final args = routeData.argsAs<PlaytimerViewArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.PlaytimerView(
          key: args.key,
          minutes: args.minutes,
          increment: args.increment,
        ),
      );
    },
    ActiveGame.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ActiveGame(),
      );
    },
    AnalysisBoard.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AnalysisBoard(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SetupView.name,
          path: '/',
        ),
        _i5.RouteConfig(
          PlaytimerView.name,
          path: '/playtimer-view',
        ),
        _i5.RouteConfig(
          ActiveGame.name,
          path: '/active-game',
        ),
        _i5.RouteConfig(
          AnalysisBoard.name,
          path: '/analysis-board',
        ),
      ];
}

/// generated route for
/// [_i1.SetupView]
class SetupView extends _i5.PageRouteInfo<void> {
  const SetupView()
      : super(
          SetupView.name,
          path: '/',
        );

  static const String name = 'SetupView';
}

/// generated route for
/// [_i2.PlaytimerView]
class PlaytimerView extends _i5.PageRouteInfo<PlaytimerViewArgs> {
  PlaytimerView({
    _i6.Key? key,
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

  final _i6.Key? key;

  final int minutes;

  final int increment;

  @override
  String toString() {
    return 'PlaytimerViewArgs{key: $key, minutes: $minutes, increment: $increment}';
  }
}

/// generated route for
/// [_i3.ActiveGame]
class ActiveGame extends _i5.PageRouteInfo<void> {
  const ActiveGame()
      : super(
          ActiveGame.name,
          path: '/active-game',
        );

  static const String name = 'ActiveGame';
}

/// generated route for
/// [_i4.AnalysisBoard]
class AnalysisBoard extends _i5.PageRouteInfo<void> {
  const AnalysisBoard()
      : super(
          AnalysisBoard.name,
          path: '/analysis-board',
        );

  static const String name = 'AnalysisBoard';
}
