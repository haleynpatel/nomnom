import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'snack_summary_widget.dart' show SnackSummaryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SnackSummaryModel extends FlutterFlowModel<SnackSummaryWidget> {
  ///  Local state fields for this page.

  SummaryStruct? summary;
  void updateSummaryStruct(Function(SummaryStruct) updateFn) {
    updateFn(summary ??= SummaryStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
