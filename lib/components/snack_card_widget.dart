import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'snack_card_model.dart';
export 'snack_card_model.dart';

class SnackCardWidget extends StatefulWidget {
  const SnackCardWidget({
    super.key,
    required this.title,
    this.author,
    bool? showSummarize,
  }) : this.showSummarize = showSummarize ?? false;

  final String? title;
  final String? author;
  final bool showSummarize;

  @override
  State<SnackCardWidget> createState() => _SnackCardWidgetState();
}

class _SnackCardWidgetState extends State<SnackCardWidget> {
  late SnackCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 557.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.title,
                          'snack',
                        ).maybeHandleOverflow(
                          maxChars: 300,
                          replacement: '…',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF45A35A),
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.author,
                          'country',
                        ),
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.showSummarize)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFF45A35A),
                    icon: Icon(
                      Icons.text_snippet,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await geminiGenerateText(
                        context,
                        '${FFAppConstants.summarizePrompt}${widget!.title}-${widget!.author}',
                      ).then((generatedText) {
                        safeSetState(
                            () => _model.summarizationResult = generatedText);
                      });

                      _model.summaryStruct = await actions.toSummary(
                        _model.summarizationResult!,
                      );
                      FFAppState().currentSummary = _model.summaryStruct!;
                      safeSetState(() {});

                      context.pushNamed(
                        'SnackSummary',
                        queryParameters: {
                          'bookTitle': serializeParam(
                            widget!.title,
                            ParamType.String,
                          ),
                          'bookAuthor': serializeParam(
                            widget!.author,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );

                      safeSetState(() {});
                    },
                  ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}
