import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticketid" field.
  String? _ticketid;
  String get ticketid => _ticketid ?? '';
  bool hasTicketid() => _ticketid != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "tticket" field.
  String? _tticket;
  String get tticket => _tticket ?? '';
  bool hasTticket() => _tticket != null;

  // "timage" field.
  List<String>? _timage;
  List<String> get timage => _timage ?? const [];
  bool hasTimage() => _timage != null;

  // "ttitle" field.
  String? _ttitle;
  String get ttitle => _ttitle ?? '';
  bool hasTtitle() => _ttitle != null;

  void _initializeFields() {
    _ticketid = snapshotData['ticketid'] as String?;
    _userid = snapshotData['userid'] as String?;
    _tticket = snapshotData['tticket'] as String?;
    _timage = getDataList(snapshotData['timage']);
    _ttitle = snapshotData['ttitle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tickets');

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  String? ticketid,
  String? userid,
  String? tticket,
  String? ttitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticketid': ticketid,
      'userid': userid,
      'tticket': tticket,
      'ttitle': ttitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ticketid == e2?.ticketid &&
        e1?.userid == e2?.userid &&
        e1?.tticket == e2?.tticket &&
        listEquality.equals(e1?.timage, e2?.timage) &&
        e1?.ttitle == e2?.ttitle;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality()
      .hash([e?.ticketid, e?.userid, e?.tticket, e?.timage, e?.ttitle]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
