import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reviewer" field.
  DocumentReference? _reviewer;
  DocumentReference? get reviewer => _reviewer;
  bool hasReviewer() => _reviewer != null;

  // "reviewed" field.
  DocumentReference? _reviewed;
  DocumentReference? get reviewed => _reviewed;
  bool hasReviewed() => _reviewed != null;

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

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _reviewer = snapshotData['reviewer'] as DocumentReference?;
    _reviewed = snapshotData['reviewed'] as DocumentReference?;
    _rate1 = castToType<double>(snapshotData['rate1']);
    _rate2 = castToType<double>(snapshotData['rate2']);
    _rate3 = castToType<double>(snapshotData['rate3']);
    _rate4 = castToType<double>(snapshotData['rate4']);
    _average = castToType<double>(snapshotData['average']);
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? reviewer,
  DocumentReference? reviewed,
  double? rate1,
  double? rate2,
  double? rate3,
  double? rate4,
  double? average,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewer': reviewer,
      'reviewed': reviewed,
      'rate1': rate1,
      'rate2': rate2,
      'rate3': rate3,
      'rate4': rate4,
      'average': average,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.reviewer == e2?.reviewer &&
        e1?.reviewed == e2?.reviewed &&
        e1?.rate1 == e2?.rate1 &&
        e1?.rate2 == e2?.rate2 &&
        e1?.rate3 == e2?.rate3 &&
        e1?.rate4 == e2?.rate4 &&
        e1?.average == e2?.average &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.reviewer,
        e?.reviewed,
        e?.rate1,
        e?.rate2,
        e?.rate3,
        e?.rate4,
        e?.average,
        e?.feedback
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
