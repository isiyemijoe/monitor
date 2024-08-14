import 'package:flutter/material.dart';
import 'package:monitor/modules/home/presentation/viewmodels/monitor_home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class IdleStateView extends StatelessWidget {
  const IdleStateView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorHomeScreenViewmodel>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const Text(
            "Click the button below to start session",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.large(
            onPressed: vm.startSession,
            child: Icon(Icons.emergency_recording_sharp),
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
