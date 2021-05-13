// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:flutter_tools/src/base/io.dart';

import '../src/common.dart';
import '../src/context.dart';
import 'test_utils.dart';

final String toolBackend = fileSystem.path.join(getFlutterRoot(), 'packages', 'flutter_tools', 'bin', 'tool_backend.dart');
final String examplePath = fileSystem.path.join(getFlutterRoot(), 'examples', 'hello_world');
final String dart = fileSystem.path.join(getFlutterRoot(), 'bin', platform.isWindows ? 'dart.bat' : 'dart');

void main() {
  testUsingContext('tool_backend.dart exits if PROJECT_DIR is not set', () async {
    final ProcessResult result = await processManager.run(<String>[
      dart,
      toolBackend,
      'linux-x64',
      'debug',
    ]);

    expect(result.exitCode, 1);
    expect(result.stderr, contains('PROJECT_DIR environment variable must be set to the location of Flutter project to be built.'));
  });

  testUsingContext('tool_backend.dart exits if FLUTTER_ROOT is not set', () async {
    // Removing parent environment means that batch script cannot be run.
    final String dart = fileSystem.path.join(getFlutterRoot(), 'bin', 'cache', 'dart-sdk', 'bin', platform.isWindows ? 'dart.exe' : 'dart');

    final ProcessResult result = await processManager.run(<String>[
      dart,
      toolBackend,
      'linux-x64',
      'debug',
    ], environment: <String, String>{
      'PROJECT_DIR': examplePath,
    }, includeParentEnvironment: false); // Prevent FLUTTER_ROOT set by test environment from leaking

    expect(result.exitCode, 1);
    expect(result.stderr, contains('FLUTTER_ROOT environment variable must be set to the location of the Flutter SDK.'));
  });

  testUsingContext('tool_backend.dart exits if local engine does not match build mode', () async {
    final ProcessResult result = await processManager.run(<String>[
      dart,
      toolBackend,
      'linux-x64',
      'debug',
    ], environment: <String, String>{
      'PROJECT_DIR': examplePath,
      'LOCAL_ENGINE': 'release_foo_bar', // Does not contain "debug",
    });

    expect(result.exitCode, 1);
    expect(result.stderr, contains('ERROR: Requested build with Flutter local engine at \'release_foo_bar\''));
  });
}
