import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ConfigHive {
  static const envTypeId = 1;

  static late Box db;

  static Future<void> init() async {
    final filesDir = await getApplicationSupportDirectory();
    final path = '${filesDir.path}${Platform.pathSeparator}config${Platform.pathSeparator}hivedb';
    // logd("path: $path");
    Hive.init(path);
    db = await Hive.openBox('ConfigDB');
  }
}