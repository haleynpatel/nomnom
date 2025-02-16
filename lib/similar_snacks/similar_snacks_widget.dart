import '/backend/backend.dart';
import '/components/snack_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'similar_snacks_model.dart';
export 'similar_snacks_model.dart';

class SimilarSnacksWidget extends StatefulWidget {
  const SimilarSnacksWidget({super.key});

  @override
  State<SimilarSnacksWidget> createState() => _SimilarSnacksWidgetState();
}

class _SimilarSnacksWidgetState extends State<SimilarSnacksWidget> {
  late SimilarSnacksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimilarSnacksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            'Similar Snacks',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: StreamBuilder<List<BooksRecord>>(
                      stream: queryBooksRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<BooksRecord> columnBooksRecordList =
                            snapshot.data!;

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(columnBooksRecordList.length,
                                        (columnIndex) {
                              final columnBooksRecord =
                                  columnBooksRecordList[columnIndex];
                              return SnackCardWidget(
                                key: Key(
                                    'Keyd19_${columnIndex}_of_${columnBooksRecordList.length}'),
                                title: columnBooksRecord.title,
                                author: columnBooksRecord.author,
                                showSummarize: true,
                              );
                            })
                                    .divide(SizedBox(height: 10.0))
                                    .around(SizedBox(height: 10.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
