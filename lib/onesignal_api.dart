import 'dart:ui';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';

class OneSignalApi {
  static Future setupOneSignal() async {
    final String? deviceId = await PlatformDeviceId.getDeviceId;
    final String deviceLang = window.locale.languageCode;

    OneSignal oneSignal = OneSignal.shared;

    //bildirim izni
    oneSignal.promptUserForPushNotificationPermission();

    oneSignal.setAppId("1cb1e4a9-3d14-4ae6-bca0-58a4753b7774");
    oneSignal.setExternalUserId(deviceId!);
    oneSignal.setLanguage(deviceLang);
    oneSignal.sendTags({"deviceId": deviceId, "deviceLang": deviceLang});

    oneSignal.setNotificationOpenedHandler((openedResult) {
      String? data = openedResult.notification.additionalData as String?;
      if (data != null) {
        //bildirime tıklandığında ne olacağı.
      }
    });
  }
}
