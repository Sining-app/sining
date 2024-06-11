import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerformerAvailabilityRecord extends FirestoreRecord {
  PerformerAvailabilityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventName" field.
  DocumentReference? _eventName;
  DocumentReference? get eventName => _eventName;
  bool hasEventName() => _eventName != null;

  // "date" field.
  DocumentReference? _date;
  DocumentReference? get date => _date;
  bool hasDate() => _date != null;

  // "performer" field.
  DocumentReference? _performer;
  DocumentReference? get performer => _performer;
  bool hasPerformer() => _performer != null;

  void _initializeFields() {
    _eventName = snapshotData['eventName'] as DocumentReference?;
    _date = snapshotData['date'] as DocumentReference?;
    _performer = snapshotData['performer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('performerAvailability');

  static Stream<PerformerAvailabilityRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PerformerAvailabilityRecord.fromSnapshot(s));

  static Future<PerformerAvailabilityRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PerformerAvailabilityRecord.fromSnapshot(s));

  static PerformerAvailabilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PerformerAvailabilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerformerAvailabilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerformerAvailabilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerformerAvailabilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerformerAvailabilityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerformerAvailabilityRecordData({
  DocumentReference? eventName,
  DocumentReference? date,
  DocumentReference? performer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventName': eventName,
      'date': date,
      'performer': performer,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerformerAvailabilityRecordDocumentEquality
    implements Equality<PerformerAvailabilityRecord> {
  const PerformerAvailabilityRecordDocumentEquality();

  @override
  bool equals(
      PerformerAvailabilityRecord? e1, PerformerAvailabilityRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.date == e2?.date &&
        e1?.performer == e2?.performer;
  }

  @override
  int hash(PerformerAvailabilityRecord? e) =>
      const ListEquality().hash([e?.eventName, e?.date, e?.performer]);

  @override
  bool isValidKey(Object? o) => o is PerformerAvailabilityRecord;
}
