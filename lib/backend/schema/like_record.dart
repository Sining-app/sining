import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikeRecord extends FirestoreRecord {
  LikeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _post = snapshotData['post'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('like');

  static Stream<LikeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikeRecord.fromSnapshot(s));

  static Future<LikeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikeRecord.fromSnapshot(s));

  static LikeRecord fromSnapshot(DocumentSnapshot snapshot) => LikeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikeRecordData({
  DocumentReference? post,
  DocumentReference? user,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post': post,
      'user': user,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikeRecordDocumentEquality implements Equality<LikeRecord> {
  const LikeRecordDocumentEquality();

  @override
  bool equals(LikeRecord? e1, LikeRecord? e2) {
    return e1?.post == e2?.post && e1?.user == e2?.user && e1?.time == e2?.time;
  }

  @override
  int hash(LikeRecord? e) =>
      const ListEquality().hash([e?.post, e?.user, e?.time]);

  @override
  bool isValidKey(Object? o) => o is LikeRecord;
}
