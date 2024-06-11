import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepliesRecord extends FirestoreRecord {
  RepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "replyto" field.
  DocumentReference? _replyto;
  DocumentReference? get replyto => _replyto;
  bool hasReplyto() => _replyto != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _post = snapshotData['post'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _replyto = snapshotData['replyto'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('replies');

  static Stream<RepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepliesRecord.fromSnapshot(s));

  static Future<RepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepliesRecord.fromSnapshot(s));

  static RepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepliesRecordData({
  DocumentReference? user,
  DocumentReference? post,
  String? comment,
  DocumentReference? replyto,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'post': post,
      'comment': comment,
      'replyto': replyto,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepliesRecordDocumentEquality implements Equality<RepliesRecord> {
  const RepliesRecordDocumentEquality();

  @override
  bool equals(RepliesRecord? e1, RepliesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.post == e2?.post &&
        e1?.comment == e2?.comment &&
        e1?.replyto == e2?.replyto &&
        e1?.time == e2?.time;
  }

  @override
  int hash(RepliesRecord? e) => const ListEquality()
      .hash([e?.user, e?.post, e?.comment, e?.replyto, e?.time]);

  @override
  bool isValidKey(Object? o) => o is RepliesRecord;
}
