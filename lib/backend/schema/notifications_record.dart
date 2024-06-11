import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  bool hasNotificationBody() => _notificationBody != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  void _initializeFields() {
    _notificationBody = snapshotData['notification_body'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _post = snapshotData['post'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationBody,
  DocumentReference? user,
  DocumentReference? post,
  DateTime? time,
  String? title,
  DocumentReference? sender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_body': notificationBody,
      'user': user,
      'post': post,
      'time': time,
      'title': title,
      'sender': sender,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notificationBody == e2?.notificationBody &&
        e1?.user == e2?.user &&
        e1?.post == e2?.post &&
        e1?.time == e2?.time &&
        e1?.title == e2?.title &&
        e1?.sender == e2?.sender;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash(
      [e?.notificationBody, e?.user, e?.post, e?.time, e?.title, e?.sender]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
