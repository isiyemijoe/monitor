// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router_config.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MonitorHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MonitorHomeScreen()),
      );
    }
  };
}

/// generated route for
/// [MonitorHomeScreen]
class MonitorHomeRoute extends PageRouteInfo<void> {
  const MonitorHomeRoute({List<PageRouteInfo>? children})
      : super(
          MonitorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MonitorHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
