import 'package:camera_macos/camera_macos_arguments.dart';
import 'package:camera_macos/camera_macos_controller.dart';
import 'package:camera_macos/camera_macos_view.dart';
import 'package:flutter/material.dart';
import 'package:monitor/modules/home/presentation/viewmodels/monitor_home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorHomeScreenViewmodel>();
    return SizedBox(
      height: 150,
      width: 250,
      child: CameraMacOSView(
        key: vm.cameraKey,
        fit: BoxFit.fill,
        cameraMode: CameraMacOSMode.video,
        onCameraInizialized: (CameraMacOSController controller) {
          vm.setCameraController(controller);
        },
      ),
    );
  }
}
