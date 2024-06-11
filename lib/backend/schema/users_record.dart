import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "fname" field.
  String? _fname;
  String get fname => _fname ?? '';
  bool hasFname() => _fname != null;

  // "lname" field.
  String? _lname;
  String get lname => _lname ?? '';
  bool hasLname() => _lname != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "skillset" field.
  List<String>? _skillset;
  List<String> get skillset => _skillset ?? const [];
  bool hasSkillset() => _skillset != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "rate1" field.
  double? _rate1;
  double get rate1 => _rate1 ?? 0.0;
  bool hasRate1() => _rate1 != null;

  // "rate2" field.
  double? _rate2;
  double get rate2 => _rate2 ?? 0.0;
  bool hasRate2() => _rate2 != null;

  // "rate3" field.
  double? _rate3;
  double get rate3 => _rate3 ?? 0.0;
  bool hasRate3() => _rate3 != null;

  // "rate4" field.
  double? _rate4;
  double get rate4 => _rate4 ?? 0.0;
  bool hasRate4() => _rate4 != null;

  // "average" field.
  double? _average;
  double get average => _average ?? 0.0;
  bool hasAverage() => _average != null;

  // "user_blocked" field.
  List<DocumentReference>? _userBlocked;
  List<DocumentReference> get userBlocked => _userBlocked ?? const [];
  bool hasUserBlocked() => _userBlocked != null;

  // "fb" field.
  String? _fb;
  String get fb => _fb ?? '';
  bool hasFb() => _fb != null;

  // "ig" field.
  String? _ig;
  String get ig => _ig ?? '';
  bool hasIg() => _ig != null;

  // "yt" field.
  String? _yt;
  String get yt => _yt ?? '';
  bool hasYt() => _yt != null;

  // "loc" field.
  String? _loc;
  String get loc => _loc ?? '';
  bool hasLoc() => _loc != null;

  // "portfolio" field.
  List<String>? _portfolio;
  List<String> get portfolio => _portfolio ?? const [];
  bool hasPortfolio() => _portfolio != null;

  // "coverPhoto" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fname = snapshotData['fname'] as String?;
    _lname = snapshotData['lname'] as String?;
    _type = snapshotData['type'] as String?;
    _skillset = getDataList(snapshotData['skillset']);
    _bio = snapshotData['bio'] as String?;
    _rate1 = castToType<double>(snapshotData['rate1']);
    _rate2 = castToType<double>(snapshotData['rate2']);
    _rate3 = castToType<double>(snapshotData['rate3']);
    _rate4 = castToType<double>(snapshotData['rate4']);
    _average = castToType<double>(snapshotData['average']);
    _userBlocked = getDataList(snapshotData['user_blocked']);
    _fb = snapshotData['fb'] as String?;
    _ig = snapshotData['ig'] as String?;
    _yt = snapshotData['yt'] as String?;
    _loc = snapshotData['loc'] as String?;
    _portfolio = getDataList(snapshotData['portfolio']);
    _coverPhoto = snapshotData['coverPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? fname,
  String? lname,
  String? type,
  String? bio,
  double? rate1,
  double? rate2,
  double? rate3,
  double? rate4,
  double? average,
  String? fb,
  String? ig,
  String? yt,
  String? loc,
  String? coverPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'fname': fname,
      'lname': lname,
      'type': type,
      'bio': bio,
      'rate1': rate1,
      'rate2': rate2,
      'rate3': rate3,
      'rate4': rate4,
      'average': average,
      'fb': fb,
      'ig': ig,
      'yt': yt,
      'loc': loc,
      'coverPhoto': coverPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fname == e2?.fname &&
        e1?.lname == e2?.lname &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.skillset, e2?.skillset) &&
        e1?.bio == e2?.bio &&
        e1?.rate1 == e2?.rate1 &&
        e1?.rate2 == e2?.rate2 &&
        e1?.rate3 == e2?.rate3 &&
        e1?.rate4 == e2?.rate4 &&
        e1?.average == e2?.average &&
        listEquality.equals(e1?.userBlocked, e2?.userBlocked) &&
        e1?.fb == e2?.fb &&
        e1?.ig == e2?.ig &&
        e1?.yt == e2?.yt &&
        e1?.loc == e2?.loc &&
        listEquality.equals(e1?.portfolio, e2?.portfolio) &&
        e1?.coverPhoto == e2?.coverPhoto;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fname,
        e?.lname,
        e?.type,
        e?.skillset,
        e?.bio,
        e?.rate1,
        e?.rate2,
        e?.rate3,
        e?.rate4,
        e?.average,
        e?.userBlocked,
        e?.fb,
        e?.ig,
        e?.yt,
        e?.loc,
        e?.portfolio,
        e?.coverPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
