// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummaryStruct extends FFFirebaseStruct {
  SummaryStruct({
    String? overview,
    List<String>? themes,
    List<String>? quotes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _overview = overview,
        _themes = themes,
        _quotes = quotes,
        super(firestoreUtilData);

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  set overview(String? val) => _overview = val;

  bool hasOverview() => _overview != null;

  // "themes" field.
  List<String>? _themes;
  List<String> get themes => _themes ?? const [];
  set themes(List<String>? val) => _themes = val;

  void updateThemes(Function(List<String>) updateFn) {
    updateFn(_themes ??= []);
  }

  bool hasThemes() => _themes != null;

  // "quotes" field.
  List<String>? _quotes;
  List<String> get quotes => _quotes ?? const [];
  set quotes(List<String>? val) => _quotes = val;

  void updateQuotes(Function(List<String>) updateFn) {
    updateFn(_quotes ??= []);
  }

  bool hasQuotes() => _quotes != null;

  static SummaryStruct fromMap(Map<String, dynamic> data) => SummaryStruct(
        overview: data['overview'] as String?,
        themes: getDataList(data['themes']),
        quotes: getDataList(data['quotes']),
      );

  static SummaryStruct? maybeFromMap(dynamic data) =>
      data is Map ? SummaryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'overview': _overview,
        'themes': _themes,
        'quotes': _quotes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'overview': serializeParam(
          _overview,
          ParamType.String,
        ),
        'themes': serializeParam(
          _themes,
          ParamType.String,
          isList: true,
        ),
        'quotes': serializeParam(
          _quotes,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      SummaryStruct(
        overview: deserializeParam(
          data['overview'],
          ParamType.String,
          false,
        ),
        themes: deserializeParam<String>(
          data['themes'],
          ParamType.String,
          true,
        ),
        quotes: deserializeParam<String>(
          data['quotes'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SummaryStruct &&
        overview == other.overview &&
        listEquality.equals(themes, other.themes) &&
        listEquality.equals(quotes, other.quotes);
  }

  @override
  int get hashCode => const ListEquality().hash([overview, themes, quotes]);
}

SummaryStruct createSummaryStruct({
  String? overview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SummaryStruct(
      overview: overview,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SummaryStruct? updateSummaryStruct(
  SummaryStruct? summary, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    summary
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSummaryStructData(
  Map<String, dynamic> firestoreData,
  SummaryStruct? summary,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (summary == null) {
    return;
  }
  if (summary.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && summary.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final summaryData = getSummaryFirestoreData(summary, forFieldValue);
  final nestedData = summaryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = summary.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSummaryFirestoreData(
  SummaryStruct? summary, [
  bool forFieldValue = false,
]) {
  if (summary == null) {
    return {};
  }
  final firestoreData = mapToFirestore(summary.toMap());

  // Add any Firestore field values
  summary.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSummaryListFirestoreData(
  List<SummaryStruct>? summarys,
) =>
    summarys?.map((e) => getSummaryFirestoreData(e, true)).toList() ?? [];
