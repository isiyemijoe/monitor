import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monitor/_core_/state/ui_state_binding.dart';
import 'package:monitor/modules/home/presentation/state/home_ui_state.dart';
import 'package:monitor/modules/home/presentation/viewmodels/monitor_home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

import 'camera_view.dart';

class MonitoringView extends StatelessWidget {
  const MonitoringView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorHomeScreenViewmodel>();

    return Column(
      children: [
        const Text("Monitoring View"),
        // TextButton(onPressed: vm.stopMonitoring, child: Text("Stop Monitoring")),
        TimeDisplay(),
        const Expanded(child: const FilesView()),
        const BottomView(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorHomeScreenViewmodel>();

    return Row(
      children: [
        const CameraView(),
        ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: FloatingActionButton(
              onPressed: vm.stopMonitoring,
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.stop,
                color: Colors.white,
              ),
            )),
        SizedBox.shrink()
      ],
    );
  }
}

class TimeDisplay extends StatefulWidget {
  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 4), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int milliseconds) {
    int minutes = (milliseconds ~/ 60000);
    int seconds = ((milliseconds % 60000) ~/ 1000);
    int millis = (milliseconds % 1000);

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String millisStr =
        (millis ~/ 10).toString().padLeft(2, '0'); // Two-digit milliseconds

    return "$minutesStr:$secondsStr:$millisStr";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_stopwatch.elapsedMilliseconds),
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}

class FilesView extends StatelessWidget {
  const FilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return UiStateBinding.bind<MonitorHomeScreenViewmodel, List<SessionShot>>(
        value: (vm) => vm.uiState.sessionShots,
        to: (context, shots, vm) {
          return GridView.builder(
              itemCount: shots.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                final shot = shots[index];

                return Container(
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Expanded(child: Image.memory(shot.screenShot)),
                      Expanded(child: Image.memory(shot.camShot))
                    ],
                  ),
                );
              });
        });
  }
}
