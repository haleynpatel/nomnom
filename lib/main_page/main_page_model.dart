import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/components/snack_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'main_page_widget.dart' show MainPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imageFile;

  List<BookEntryStruct> bookEntries = [];
  void addToBookEntries(BookEntryStruct item) => bookEntries.add(item);
  void removeFromBookEntries(BookEntryStruct item) => bookEntries.remove(item);
  void removeAtIndexFromBookEntries(int index) => bookEntries.removeAt(index);
  void insertAtIndexInBookEntries(int index, BookEntryStruct item) =>
      bookEntries.insert(index, item);
  void updateBookEntriesAtIndex(
          int index, Function(BookEntryStruct) updateFn) =>
      bookEntries[index] = updateFn(bookEntries[index]);

  int? idx = 0;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Gemini - Text From Image] action in IconButton widget.
  String? bookDetections;
  // Stores action output result for [Custom Action - toBookEntries] action in IconButton widget.
  List<BookEntryStruct>? bookEntriesOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
