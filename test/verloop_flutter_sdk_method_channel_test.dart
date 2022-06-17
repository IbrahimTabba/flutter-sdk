import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:verloop_flutter_sdk/verloop_flutter_sdk_method_channel.dart';

void main() {
  MethodChannelVerloopFlutterSdk platform = MethodChannelVerloopFlutterSdk();
  const MethodChannel channel = MethodChannel('verloop_flutter_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
