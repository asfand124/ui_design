import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class TaskTimer extends StatefulWidget {
  @override
  _TaskTimerState createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  final DateTime assignedAt = DateTime.parse("2024-02-16 22:50:10").toUtc();
  final int taskDuration = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        Duration remainingTime = assignedAt
            .add(Duration(hours: taskDuration))
            .difference(DateTime.now().toUtc());
        int elapsedHours = taskDuration * 3600 -
            remainingTime.inSeconds.clamp(0, taskDuration * 3600);

        String extraText;
        if (remainingTime.inSeconds <= 0) {
          extraText = '-time';
        } else if (remainingTime.inSeconds <= taskDuration * 3600) {
          extraText = 'x1';
        } else if (remainingTime.inSeconds <= taskDuration * 2 * 3600) {
          extraText = 'x2';
        } else {
          extraText = 'x3';
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Countdown: ${_formatDuration(remainingTime)} $extraText',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Elapsed Extra Time: ${_formatDuration(Duration(seconds: elapsedHours))}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      }),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
}