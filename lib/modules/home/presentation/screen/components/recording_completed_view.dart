import 'package:flutter/material.dart';
import 'package:monitor/modules/home/presentation/screen/components/monitoring_view.dart';
import 'package:monitor/modules/home/presentation/viewmodels/monitor_home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class RecordingCompletedView extends StatelessWidget {
  const RecordingCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorHomeScreenViewmodel>();
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Session Completed",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const Expanded(child: FilesView()),
        const Spacer(),
        SizedBox(
            height: 50,
            width: 200,
            child: FilledButton(
                onPressed: vm.closeSession, child: Text("Go home"))),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
