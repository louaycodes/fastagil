import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KioskServicesRecord extends FirestoreRecord {
  KioskServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_available" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "specific_duration_minutes" field.
  int? _specificDurationMinutes;
  int get specificDurationMinutes => _specificDurationMinutes ?? 0;
  bool hasSpecificDurationMinutes() => _specificDurationMinutes != null;

  // "kiosk_id" field.
  DocumentReference? _kioskId;
  DocumentReference? get kioskId => _kioskId;
  bool hasKioskId() => _kioskId != null;

  // "service_id" field.
  DocumentReference? _serviceId;
  DocumentReference? get serviceId => _serviceId;
  bool hasServiceId() => _serviceId != null;

  void _initializeFields() {
    _isAvailable = snapshotData['is_available'] as bool?;
    _specificDurationMinutes =
        castToType<int>(snapshotData['specific_duration_minutes']);
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _serviceId = snapshotData['service_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kiosk_services');

  static Stream<KioskServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KioskServicesRecord.fromSnapshot(s));

  static Future<KioskServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KioskServicesRecord.fromSnapshot(s));

  static KioskServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KioskServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KioskServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KioskServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KioskServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KioskServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKioskServicesRecordData({
  bool? isAvailable,
  int? specificDurationMinutes,
  DocumentReference? kioskId,
  DocumentReference? serviceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_available': isAvailable,
      'specific_duration_minutes': specificDurationMinutes,
      'kiosk_id': kioskId,
      'service_id': serviceId,
    }.withoutNulls,
  );

  return firestoreData;
}

class KioskServicesRecordDocumentEquality
    implements Equality<KioskServicesRecord> {
  const KioskServicesRecordDocumentEquality();

  @override
  bool equals(KioskServicesRecord? e1, KioskServicesRecord? e2) {
    return e1?.isAvailable == e2?.isAvailable &&
        e1?.specificDurationMinutes == e2?.specificDurationMinutes &&
        e1?.kioskId == e2?.kioskId &&
        e1?.serviceId == e2?.serviceId;
  }

  @override
  int hash(KioskServicesRecord? e) => const ListEquality().hash(
      [e?.isAvailable, e?.specificDurationMinutes, e?.kioskId, e?.serviceId]);

  @override
  bool isValidKey(Object? o) => o is KioskServicesRecord;
}
