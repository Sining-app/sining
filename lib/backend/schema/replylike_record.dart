import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReplylikeRecord extends FirestoreRecord {
  ReplylikeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "reply" field.
  DocumentReference? _reply;
  DocumentReference? get reply => _reply;
  bool hasReply() => _reply != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _reply = snapshotData['reply'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('replylike');

  static Stream<ReplylikeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReplylikeRecord.fromSnapshot(s));

  static Future<ReplylikeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReplylikeRecord.fromSnapshot(s));

  static ReplylikeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReplylikeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReplylikeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReplylikeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReplylikeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReplylikeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReplylikeRecordData({
  DocumentReference? user,
  DateTime? time,
  DocumentReference? reply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'time': time,
      'reply': reply,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReplylikeRecordDocumentEquality implements Equality<ReplylikeRecord> {
  const ReplylikeRecordDocumentEquality();

  @override
  bool equals(ReplylikeRecord? e1, ReplylikeRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.time == e2?.time &&
        e1?.reply == e2?.reply;
  }

  @override
  int hash(ReplylikeRecord? e) =>
      const ListEquality().hash([e?.user, e?.time, e?.reply]);

  @override
  bool isValidKey(Object? o) => o is ReplylikeRecord;
}
