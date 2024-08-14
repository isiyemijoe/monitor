import 'dart:io';
import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_state.freezed.dart';

@freezed
class HomeUiState with _$HomeUiState {
  factory HomeUiState(
          {@Default(5) int startCountDown,
          @Default(false) bool hasMonitoringStarted,
          @Default([]) List<SessionShot> sessionShots,
          @Default(IdleMonitoringState()) MonitoringState monitoringState}) =
      _HomeUiState;
}

class SessionShot {
  Uint8List screenShot;
  Uint8List camShot;
  SessionShot({required this.screenShot, required this.camShot});
}

sealed class MonitoringState {
  const MonitoringState();

  factory MonitoringState.idle() = IdleMonitoringState;
  factory MonitoringState.countDown(int countDown) = CountDownMonitoringState;
  factory MonitoringState.active() = ActiveMonitoringState;
  factory MonitoringState.completed() = CompletedMonitoringState;
  factory MonitoringState.failed(String error) = FailedMonitoringState;
}

class IdleMonitoringState extends MonitoringState {
  const IdleMonitoringState();
}

class CountDownMonitoringState extends MonitoringState {
  const CountDownMonitoringState(this.countDown);
  final int countDown;
}

class ActiveMonitoringState extends MonitoringState {
  const ActiveMonitoringState();
}

class CompletedMonitoringState extends MonitoringState {
  const CompletedMonitoringState();
}

class FailedMonitoringState extends MonitoringState {
  const FailedMonitoringState(this.errorMessage);
  final String errorMessage;
}
