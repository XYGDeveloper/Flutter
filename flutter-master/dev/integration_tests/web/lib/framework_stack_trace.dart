// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html' as html;

import 'package:meta/dart2js.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Tests that the framework prints stack traces in all build modes.
//
// Regression test for https://github.com/flutter/flutter/issues/68616.
//
// See also `dev/integration_tests/web/lib/stack_trace.dart` that tests the
// framework's ability to parse stack traces in all build modes.
void main() async {
  final StringBuffer errorMessage = StringBuffer();
  debugPrint = (String? message, { int? wrapWidth }) {
    errorMessage.writeln(message);
  };

  runApp(ThrowingWidget());

  // Let the framework flush error messages.
  await Future<void>.delayed(Duration.zero);

  final StringBuffer output = StringBuffer();
  if (_errorMessageFormattedCorrectly(errorMessage.toString())) {
    output.writeln('--- TEST SUCCEEDED ---');
  } else  {
    output.writeln('--- UNEXPECTED ERROR MESSAGE FORMAT ---');
    output.writeln(errorMessage);
    output.writeln('--- TEST FAILED ---');
  }

  print(output);
  html.HttpRequest.request(
    '/test-result',
    method: 'POST',
    sendData: '$output',
  );
}

bool _errorMessageFormattedCorrectly(String errorMessage) {
  if (!errorMessage.contains('Test error message')) {
    return false;
  }

  // In release mode symbols are minified. No sense testing the contents of the stack trace.
  if (kReleaseMode) {
    return true;
  }

  const List<String> expectedFunctions = <String>[
    'topLevelFunction',
    'secondLevelFunction',
    'thirdLevelFunction',
  ];

  return expectedFunctions.every(errorMessage.contains);
}

class ThrowingWidget extends StatefulWidget {
  @override
  _ThrowingWidgetState createState() => _ThrowingWidgetState();
}

class _ThrowingWidgetState extends State<ThrowingWidget> {
  @override
  void initState() {
    super.initState();
    topLevelFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@noInline
void topLevelFunction() {
  secondLevelFunction();
}

@noInline
void secondLevelFunction() {
  thirdLevelFunction();
}

@noInline
void thirdLevelFunction() {
  throw Exception('Test error message');
}