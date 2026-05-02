import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class TestPathProviderPlatform extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  final String appDocumentsPath;

  TestPathProviderPlatform(this.appDocumentsPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => appDocumentsPath;
}

Future<Directory> initTestDocumentsDirectory() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tempDir = await Directory.systemTemp.createTemp('google_play_test_');
  PathProviderPlatform.instance = TestPathProviderPlatform(tempDir.path);
  return tempDir;
}
