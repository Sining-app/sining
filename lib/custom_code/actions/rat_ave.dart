// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> ratAve(
  double rate1,
  double rate2,
  double rate3,
  double rate4,
) async {
  // Accepts double rate1,2,3,4 and gets average
  double sum = rate1 + rate2 + rate3 + rate4;
  double average = sum / 4;
  return average;
}
