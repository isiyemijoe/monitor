import 'package:auto_route/auto_route.dart';
import 'package:monitor/_core_/router/routes.dart';
import 'package:monitor/modules/home/presentation/screen/monitor_home_screen.dart';

part 'app_router_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter  {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MonitorHomeRoute.page, path: Routes.homeRoute, initial: true),
      ];
}
