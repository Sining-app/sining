import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportRecord extends FirestoreRecord {
  ReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postref" field.
  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  bool hasPostref() => _postref != null;

  // "reportDescription" field.
  String? _reportDescription;
  String get reportDescription => _reportDescription ?? '';
  bool hasReportDescription() => _reportDescription != null;

  // "reason" field.
  List<String>? _reason;
  List<String> get reason => _reason ?? const [];
  bool hasReason() => _reason != null;

  // "reportReason" field.
  String? _reportReason;
  String get reportReason => _reportReason ?? '';
  bool hasReportReason() => _reportReason != null;

  void _initializeFields() {
    _postref = snapshotData['postref'] as DocumentReference?;
    _reportDescription = snapshotData['reportDescription'] as String?;
    _reason = getDataList(snapshotData['reason']);
    _reportReason = snapshotData['reportReason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('report');

  static Stream<ReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportRecord.fromSnapshot(s));

  static Future<ReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportRecord.fromSnapshot(s));

  static ReportRecord fromSnapshot(DocumentSnapshot snapshot) => ReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportRecordData({
  DocumentReference? postref,
  String? reportDescription,
  String? reportReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postref': postref,
      'reportDescription': reportDescription,
      'reportReason': reportReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportRecordDocumentEquality implements Equality<ReportRecord> {
  const ReportRecordDocumentEquality();

  @override
  bool equals(ReportRecord? e1, ReportRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postref == e2?.postref &&
        e1?.reportDescription == e2?.reportDescription &&
        listEquality.equals(e1?.reason, e2?.reason) &&
        e1?.reportReason == e2?.reportReason;
  }

  @override
  int hash(ReportRecord? e) => const ListEquality()
      .hash([e?.postref, e?.reportDescription, e?.reason, e?.reportReason]);

  @override
  bool isValidKey(Object? o) => o is ReportRecord;
}
