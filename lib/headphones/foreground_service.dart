import 'dart:async';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../logger.dart';

void foregroundTaskStartCallback() {
  FlutterForegroundTask.setTaskHandler(HeadphonesTaskHandler());
}

Future<void> initForegroundTask() async {
  FlutterForegroundTask.init(
    androidNotificationOptions: AndroidNotificationOptions(
      channelId: 'headphones_foreground_service',
      channelName: 'Headphones connection service',
      channelDescription: 'Foreground service for headphone connection',
      channelImportance: NotificationChannelImportance.LOW,
      priority: NotificationPriority.LOW,
      iconData: const NotificationIconData(
        resType: ResourceType.mipmap,
        resPrefix: ResourcePrefix.ic,
        name: 'launcher',
      ),
      buttons: [
        const NotificationButton(id: 'stopButton', text: 'Stop service'),
      ],
    ),
    iosNotificationOptions: const IOSNotificationOptions(),
    foregroundTaskOptions: const ForegroundTaskOptions(
      interval: 5000,
      autoRunOnBoot: false,
      allowWifiLock: false,
    ),
  );
}

class HeadphonesTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    logg.d('onStart ^-^ yayyy');
  }

  @override
  void onButtonPressed(String id) {
    logg.d('button pressed: $id');
    if (id == 'stopButton') FlutterForegroundTask.stopService();
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    logg.d('event $timestamp');
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    logg.d('destroying :(');
  }
}
