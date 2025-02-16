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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

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
            'nomnom!',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }

                if (_model.uploadedLocalFile != null &&
                    (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
                  _model.imageFile = _model.uploadedLocalFile;
                  safeSetState(() {});
                  await geminiTextFromImage(
                    context,
                    FFAppConstants.visionPrompt,
                    uploadImageBytes: _model.imageFile,
                  ).then((generatedText) {
                    safeSetState(() => _model.bookDetections = generatedText);
                  });

                  _model.bookEntriesOut = await actions.toBookEntries(
                    _model.bookDetections!,
                  );
                  _model.bookEntries =
                      _model.bookEntriesOut!.toList().cast<BookEntryStruct>();
                  safeSetState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Unable to read image',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }

                safeSetState(() {});
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_model.imageFile != null &&
                (_model.imageFile?.bytes?.isNotEmpty ?? false))
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.memory(
                      _model.imageFile?.bytes ?? Uint8List.fromList([]),
                      width: 345.0,
                      height: 298.0,
                      fit: BoxFit.contain,
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ),
                ),
              ),
            if (_model.bookEntries.length > 0)
              FFButtonWidget(
                onPressed: () async {
                  while (_model.idx! < _model.bookEntries.length) {
                    unawaited(
                      () async {
                        await BooksRecord.collection
                            .doc()
                            .set(createBooksRecordData(
                              title: _model.bookEntries
                                  .elementAtOrNull(_model.idx!)
                                  ?.title,
                              author: _model.bookEntries
                                  .elementAtOrNull(_model.idx!)
                                  ?.author,
                            ));
                      }(),
                    );
                    _model.idx = _model.idx! + 1;
                    safeSetState(() {});
                  }

                  context.pushNamed('SimilarSnacks');
                },
                text: 'Snack History',
                icon: Icon(
                  Icons.history,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF45A35A),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Builder(
                  builder: (context) {
                    final book = _model.bookEntries.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(book.length, (bookIndex) {
                          final bookItem = book[bookIndex];
                          return SnackCardWidget(
                            key: Key('Keyz15_${bookIndex}_of_${book.length}'),
                            title: bookItem.title,
                            author: bookItem.author,
                          );
                        }).divide(SizedBox(height: 10.0)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
