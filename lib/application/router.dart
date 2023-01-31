import 'package:auto_route/auto_route.dart';
import 'package:chess/ui/views/active_game/active_game_view.dart';
import 'package:get_it/get_it.dart';

import '../ui/views/play_timer/play_timer_view.dart';
import '../ui/views/setup/setup_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SetupView, initial: true),
  AutoRoute(page: PlaytimerView),
  AutoRoute(page: ActiveGame),
])

// extend the generated private router
class $AppRouter {
  var getIt = GetIt.instance;
  late List<AutoRoute> _routes;
  List<AutoRoute> get routes => _routes;
}
