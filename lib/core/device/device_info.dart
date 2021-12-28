import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo {
  final DeviceInfoPlugin deviceInfoPlugin;

  const DeviceInfo({required this.deviceInfoPlugin});

  Future<String> getDeviceID() async {
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.androidId;
    } else {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }

}
