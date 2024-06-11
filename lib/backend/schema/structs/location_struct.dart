// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends FFFirebaseStruct {
  LocationStruct({
    LatLng? latlng,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latlng = latlng,
        _address = address,
        super(firestoreUtilData);

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;
  bool hasLatlng() => _latlng != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        latlng: data['latlng'] as LatLng?,
        address: data['address'] as String?,
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'latlng': _latlng,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        latlng == other.latlng &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([latlng, address]);
}

LocationStruct createLocationStruct({
  LatLng? latlng,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationStruct(
      latlng: latlng,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationStruct? updateLocationStruct(
  LocationStruct? location, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    location
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationStructData(
  Map<String, dynamic> firestoreData,
  LocationStruct? location,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (location == null) {
    return;
  }
  if (location.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && location.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationData = getLocationFirestoreData(location, forFieldValue);
  final nestedData = locationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = location.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationFirestoreData(
  LocationStruct? location, [
  bool forFieldValue = false,
]) {
  if (location == null) {
    return {};
  }
  final firestoreData = mapToFirestore(location.toMap());

  // Add any Firestore field values
  location.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationListFirestoreData(
  List<LocationStruct>? locations,
) =>
    locations?.map((e) => getLocationFirestoreData(e, true)).toList() ?? [];
