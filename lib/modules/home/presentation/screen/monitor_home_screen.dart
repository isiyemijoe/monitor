import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:monitor/_core_/state/base_stateless_widget.dart';
import 'package:monitor/_core_/state/ui_state_binding.dart';
import 'package:monitor/_core_/state/viewmodel_provider.dart';
import 'package:monitor/modules/home/presentation/screen/components/idle_state_view.dart';
import 'package:monitor/modules/home/presentation/screen/components/monitoring_view.dart';
import 'package:monitor/modules/home/presentation/screen/components/recording_completed_view.dart';
import 'package:monitor/modules/home/presentation/state/home_ui_state.dart';
import 'package:monitor/modules/home/presentation/viewmodels/monitor_home_screen_viewmodel.dart';

import 'components/countdown_view.dart';

@RoutePage()
class MonitorHomeScreen extends BaseStatelessWidget {
  const MonitorHomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ViewModelProvider(
      create: (_) => MonitorHomeScreenViewmodel(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: UiStateBinding.bind<MonitorHomeScreenViewmodel, MonitoringState>(
              value: (vm) => vm.uiState.monitoringState,
              to: (context, state, vm) {
                return switch (state) {
                  IdleMonitoringState() => const IdleStateView(),
                  CountDownMonitoringState(countDown: var count) => CountdownView(countDown: count),
                  ActiveMonitoringState() => const MonitoringView(),
                  CompletedMonitoringState() => const RecordingCompletedView(),
                  FailedMonitoringState() => const IdleStateView(),
                };
              }),
        ),
      ),
    );
  }
}
