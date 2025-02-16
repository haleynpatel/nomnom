import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'snack_card_widget.dart' show SnackCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SnackCardModel extends FlutterFlowModel<SnackCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? summarizationResult;
  // Stores action output result for [Custom Action - toSummary] action in IconButton widget.
  SummaryStruct? summaryStruct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
