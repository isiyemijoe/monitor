import 'package:flutter/material.dart';
import 'package:monitor/_core_/router/app_router_config.dart';

void main() {
  runApp(MonitorApp());
}

class MonitorApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
