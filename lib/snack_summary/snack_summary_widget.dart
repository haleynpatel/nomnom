import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'snack_summary_model.dart';
export 'snack_summary_model.dart';

class SnackSummaryWidget extends StatefulWidget {
  const SnackSummaryWidget({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
  });

  final String? bookTitle;
  final String? bookAuthor;

  @override
  State<SnackSummaryWidget> createState() => _SnackSummaryWidgetState();
}

class _SnackSummaryWidgetState extends State<SnackSummaryWidget> {
  late SnackSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackSummaryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF45A35A),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed('SimilarSnacks');
            },
          ),
          title: Text(
            '${widget!.bookTitle}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Overview',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF45A35A),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFAppState().currentSummary.overview,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF45A35A),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Snack Profile',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF45A35A),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final themes = FFAppState()
                          .currentSummary
                          .themes
                          .toList()
                          .take(3)
                          .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(themes.length, (themesIndex) {
                          final themesItem = themes[themesIndex];
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    themesItem,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF45A35A),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                            .divide(SizedBox(height: 0.0))
                            .around(SizedBox(height: 0.0)),
                      );
                    },
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Category',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final quotes =
                          FFAppState().currentSummary.quotes.toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(quotes.length, (quotesIndex) {
                          final quotesItem = quotes[quotesIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          );
                        }),
                      );
                    },
                  ),
                ].divide(SizedBox(height: 1.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
