import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "eventname" field.
  String? _eventname;
  String get eventname => _eventname ?? '';
  bool hasEventname() => _eventname != null;

  // "talents" field.
  List<String>? _talents;
  List<String> get talents => _talents ?? const [];
  bool hasTalents() => _talents != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  bool hasLatlng() => _latlng != null;

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  bool hasAddressName() => _addressName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "eventdate" field.
  DateTime? _eventdate;
  DateTime? get eventdate => _eventdate;
  bool hasEventdate() => _eventdate != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _images = getDataList(snapshotData['images']);
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _eventname = snapshotData['eventname'] as String?;
    _talents = getDataList(snapshotData['talents']);
    _poster = snapshotData['poster'] as DocumentReference?;
    _isActive = snapshotData['isActive'] as bool?;
    _latlng = snapshotData['latlng'] as LatLng?;
    _addressName = snapshotData['addressName'] as String?;
    _address = snapshotData['address'] as String?;
    _eventdate = snapshotData['eventdate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? content,
  String? type,
  String? title,
  DateTime? timestamp,
  String? eventname,
  DocumentReference? poster,
  bool? isActive,
  LatLng? latlng,
  String? addressName,
  String? address,
  DateTime? eventdate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'type': type,
      'title': title,
      'timestamp': timestamp,
      'eventname': eventname,
      'poster': poster,
      'isActive': isActive,
      'latlng': latlng,
      'addressName': addressName,
      'address': address,
      'eventdate': eventdate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.content == e2?.content &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.timestamp == e2?.timestamp &&
        e1?.eventname == e2?.eventname &&
        listEquality.equals(e1?.talents, e2?.talents) &&
        e1?.poster == e2?.poster &&
        e1?.isActive == e2?.isActive &&
        e1?.latlng == e2?.latlng &&
        e1?.addressName == e2?.addressName &&
        e1?.address == e2?.address &&
        e1?.eventdate == e2?.eventdate;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.content,
        e?.images,
        e?.type,
        e?.title,
        e?.timestamp,
        e?.eventname,
        e?.talents,
        e?.poster,
        e?.isActive,
        e?.latlng,
        e?.addressName,
        e?.address,
        e?.eventdate
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
