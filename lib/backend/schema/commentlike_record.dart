import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentlikeRecord extends FirestoreRecord {
  CommentlikeRecord._(
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

  // "comment" field.
  DocumentReference? _comment;
  DocumentReference? get comment => _comment;
  bool hasComment() => _comment != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _comment = snapshotData['comment'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commentlike');

  static Stream<CommentlikeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentlikeRecord.fromSnapshot(s));

  static Future<CommentlikeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentlikeRecord.fromSnapshot(s));

  static CommentlikeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentlikeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentlikeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentlikeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentlikeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentlikeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentlikeRecordData({
  DocumentReference? user,
  DateTime? time,
  DocumentReference? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'time': time,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentlikeRecordDocumentEquality implements Equality<CommentlikeRecord> {
  const CommentlikeRecordDocumentEquality();

  @override
  bool equals(CommentlikeRecord? e1, CommentlikeRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.time == e2?.time &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(CommentlikeRecord? e) =>
      const ListEquality().hash([e?.user, e?.time, e?.comment]);

  @override
  bool isValidKey(Object? o) => o is CommentlikeRecord;
}
