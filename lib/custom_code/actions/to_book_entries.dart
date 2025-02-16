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

List<BookEntryStruct> toBookEntries(String modelResponse) {
  print(modelResponse);
  // Remove json tags
  modelResponse =
      modelResponse.replaceAll("```json", "").replaceAll("```", "").trim();

  // Decode JSON
  Map<String, dynamic> bookDetections = jsonDecode(modelResponse);

  // Populate our BookEntry data type
  return bookDetections["books"]
      .map<BookEntryStruct>((detection) => BookEntryStruct(
          title: detection["title"],
          author: detection["author"],
          year: detection["year"]))
      .toList();
}
