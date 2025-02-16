// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "dart:convert";

SummaryStruct toSummary(String modelResponse) {
  // Remove json tags
  modelResponse =
      modelResponse.replaceAll("```json", "").replaceAll("```", "").trim();

  // Decode JSON
  Map<String, dynamic> summary = jsonDecode(modelResponse);

  print(summary);

  // Populate our BookEntry data type
  return SummaryStruct(
    overview: summary["overview"],
    themes: summary["themes"].cast<String>(),
    quotes: summary["quotes"].cast<String>(),
  );
}
