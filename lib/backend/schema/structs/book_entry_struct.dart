// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookEntryStruct extends FFFirebaseStruct {
  BookEntryStruct({
    String? title,
    String? author,
    String? year,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _author = author,
        _year = year,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  static BookEntryStruct fromMap(Map<String, dynamic> data) => BookEntryStruct(
        title: data['title'] as String?,
        author: data['author'] as String?,
        year: data['year'] as String?,
      );

  static BookEntryStruct? maybeFromMap(dynamic data) => data is Map
      ? BookEntryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'author': _author,
        'year': _year,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookEntryStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookEntryStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookEntryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookEntryStruct &&
        title == other.title &&
        author == other.author &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality().hash([title, author, year]);
}

BookEntryStruct createBookEntryStruct({
  String? title,
  String? author,
  String? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookEntryStruct(
      title: title,
      author: author,
      year: year,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookEntryStruct? updateBookEntryStruct(
  BookEntryStruct? bookEntry, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bookEntry
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookEntryStructData(
  Map<String, dynamic> firestoreData,
  BookEntryStruct? bookEntry,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bookEntry == null) {
    return;
  }
  if (bookEntry.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bookEntry.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookEntryData = getBookEntryFirestoreData(bookEntry, forFieldValue);
  final nestedData = bookEntryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bookEntry.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookEntryFirestoreData(
  BookEntryStruct? bookEntry, [
  bool forFieldValue = false,
]) {
  if (bookEntry == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bookEntry.toMap());

  // Add any Firestore field values
  bookEntry.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookEntryListFirestoreData(
  List<BookEntryStruct>? bookEntrys,
) =>
    bookEntrys?.map((e) => getBookEntryFirestoreData(e, true)).toList() ?? [];
