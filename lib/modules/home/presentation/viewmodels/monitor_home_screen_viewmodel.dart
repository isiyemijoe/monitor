import 'dart:async';
import 'dart:ffi';

import 'package:camera_macos/camera_macos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:monitor/_core_/services/permission_service.dart';
import 'package:monitor/_core_/state/base_view_model.dart';
import 'package:monitor/modules/home/presentation/state/home_ui_state.dart';

class MonitorHomeScreenViewmodel extends BaseViewModel {
  HomeUiState _uiState = HomeUiState();
  Timer? initializerTimer;
  Timer? monitoringTimer;
  final GlobalKey cameraKey = GlobalKey();
  late CameraMacOSController macOSCameraController;
  final _channel = MonitoringChannel();
  HomeUiState get uiState => _uiState;

  int maxSessionDurationInSeconds = 6;
  set uiState(HomeUiState state) {
    _uiState = state;
    notifyListeners();
  }

  void setCameraController(CameraMacOSController controller) {
    macOSCameraController = controller;
    startMonitoring();
  }

  void stopMonitoring() {
    monitoringTimer?.cancel();
    monitoringTimer = null;
    uiState = uiState.copyWith(monitoringState: MonitoringState.completed());
    macOSCameraController.destroy();
  }

  void closeSession() {
    uiState = uiState
        .copyWith(monitoringState: MonitoringState.idle(), sessionShots: []);
    monitoringTimer = null;
  }

  void startMonitoring() {
    monitoringTimer = Timer.periodic(const Duration(seconds: 10), (count) {
      takeScreenShot();
      if (count.tick >= maxSessionDurationInSeconds) {
        stopMonitoring();
      }
    });
  }

  void startSession() async {
    if (await MonitoringChannel.requestCameraPermission()) {
      initializerTimer = Timer.periodic(const Duration(seconds: 1), (count) {
        int countdown = initializerTimer?.tick ?? 0;

        if (countdown >= 5) {
          initializerTimer?.cancel();
          initializerTimer = null;
        }

        bool completedCountdown = countdown == 5;

        uiState = uiState.copyWith(
            monitoringState: completedCountdown
                ? MonitoringState.active()
                : MonitoringState.countDown(5 - countdown),
            hasMonitoringStarted: completedCountdown);
      });
    }
  }

  void takeScreenShot() async {
    final screenshot = await MonitoringChannel.captureScreen();
    final camshot = await macOSCameraController.takePicture();

    if (screenshot != null && camshot?.bytes != null) {
      final session =
          SessionShot(screenShot: screenshot, camShot: camshot!.bytes!);
      var sessions = List<SessionShot>.from(_uiState.sessionShots);
      sessions.add(session);
      uiState = _uiState.copyWith(sessionShots: sessions);
    }
  }
}
