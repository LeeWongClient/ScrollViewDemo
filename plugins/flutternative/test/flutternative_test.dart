import 'package:flutter_test/flutter_test.dart';
import 'package:flutternative/flutternative.dart';
import 'package:flutternative/flutternative_platform_interface.dart';
import 'package:flutternative/flutternative_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutternativePlatform
    with MockPlatformInterfaceMixin
    implements FlutternativePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutternativePlatform initialPlatform = FlutternativePlatform.instance;

  test('$MethodChannelFlutternative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutternative>());
  });

  test('getPlatformVersion', () async {
    Flutternative flutternativePlugin = Flutternative();
    MockFlutternativePlatform fakePlatform = MockFlutternativePlatform();
    FlutternativePlatform.instance = fakePlatform;

    expect(await flutternativePlugin.getPlatformVersion(), '42');
  });
}
