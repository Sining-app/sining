import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApplicationsRecord extends FirestoreRecord {
  ApplicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobID" field.
  DocumentReference? _jobID;
  DocumentReference? get jobID => _jobID;
  bool hasJobID() => _jobID != null;

  // "organizer" field.
  DocumentReference? _organizer;
  DocumentReference? get organizer => _organizer;
  bool hasOrganizer() => _organizer != null;

  // "performer" field.
  DocumentReference? _performer;
  DocumentReference? get performer => _performer;
  bool hasPerformer() => _performer != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "isHired" field.
  bool? _isHired;
  bool get isHired => _isHired ?? false;
  bool hasIsHired() => _isHired != null;

  // "letter" field.
  String? _letter;
  String get letter => _letter ?? '';
  bool hasLetter() => _letter != null;

  // "resume" field.
  String? _resume;
  String get resume => _resume ?? '';
  bool hasResume() => _resume != null;

  // "eventName" field.
  DocumentReference? _eventName;
  DocumentReference? get eventName => _eventName;
  bool hasEventName() => _eventName != null;

  // "jobname" field.
  String? _jobname;
  String get jobname => _jobname ?? '';
  bool hasJobname() => _jobname != null;

  // "jobdate" field.
  DateTime? _jobdate;
  DateTime? get jobdate => _jobdate;
  bool hasJobdate() => _jobdate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "performerConfirmed" field.
  bool? _performerConfirmed;
  bool get performerConfirmed => _performerConfirmed ?? false;
  bool hasPerformerConfirmed() => _performerConfirmed != null;

  void _initializeFields() {
    _jobID = snapshotData['jobID'] as DocumentReference?;
    _organizer = snapshotData['organizer'] as DocumentReference?;
    _performer = snapshotData['performer'] as DocumentReference?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _isHired = snapshotData['isHired'] as bool?;
    _letter = snapshotData['letter'] as String?;
    _resume = snapshotData['resume'] as String?;
    _eventName = snapshotData['eventName'] as DocumentReference?;
    _jobname = snapshotData['jobname'] as String?;
    _jobdate = snapshotData['jobdate'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _performerConfirmed = snapshotData['performerConfirmed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('applications');

  static Stream<ApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationsRecord.fromSnapshot(s));

  static Future<ApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApplicationsRecord.fromSnapshot(s));

  static ApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationsRecordData({
  DocumentReference? jobID,
  DocumentReference? organizer,
  DocumentReference? performer,
  DateTime? dateTime,
  bool? isHired,
  String? letter,
  String? resume,
  DocumentReference? eventName,
  String? jobname,
  DateTime? jobdate,
  String? status,
  bool? performerConfirmed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobID': jobID,
      'organizer': organizer,
      'performer': performer,
      'dateTime': dateTime,
      'isHired': isHired,
      'letter': letter,
      'resume': resume,
      'eventName': eventName,
      'jobname': jobname,
      'jobdate': jobdate,
      'status': status,
      'performerConfirmed': performerConfirmed,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApplicationsRecordDocumentEquality
    implements Equality<ApplicationsRecord> {
  const ApplicationsRecordDocumentEquality();

  @override
  bool equals(ApplicationsRecord? e1, ApplicationsRecord? e2) {
    return e1?.jobID == e2?.jobID &&
        e1?.organizer == e2?.organizer &&
        e1?.performer == e2?.performer &&
        e1?.dateTime == e2?.dateTime &&
        e1?.isHired == e2?.isHired &&
        e1?.letter == e2?.letter &&
        e1?.resume == e2?.resume &&
        e1?.eventName == e2?.eventName &&
        e1?.jobname == e2?.jobname &&
        e1?.jobdate == e2?.jobdate &&
        e1?.status == e2?.status &&
        e1?.performerConfirmed == e2?.performerConfirmed;
  }

  @override
  int hash(ApplicationsRecord? e) => const ListEquality().hash([
        e?.jobID,
        e?.organizer,
        e?.performer,
        e?.dateTime,
        e?.isHired,
        e?.letter,
        e?.resume,
        e?.eventName,
        e?.jobname,
        e?.jobdate,
        e?.status,
        e?.performerConfirmed
      ]);

  @override
  bool isValidKey(Object? o) => o is ApplicationsRecord;
}
