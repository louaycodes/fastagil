import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentSlotsRecord extends FirestoreRecord {
  AppointmentSlotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "kiosk_id" field.
  DocumentReference? _kioskId;
  DocumentReference? get kioskId => _kioskId;
  bool hasKioskId() => _kioskId != null;

  // "service_id" field.
  DocumentReference? _serviceId;
  DocumentReference? get serviceId => _serviceId;
  bool hasServiceId() => _serviceId != null;

  // "slot_date" field.
  DateTime? _slotDate;
  DateTime? get slotDate => _slotDate;
  bool hasSlotDate() => _slotDate != null;

  // "slot_time" field.
  DateTime? _slotTime;
  DateTime? get slotTime => _slotTime;
  bool hasSlotTime() => _slotTime != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "booked_count" field.
  int? _bookedCount;
  int get bookedCount => _bookedCount ?? 0;
  bool hasBookedCount() => _bookedCount != null;

  // "is_available" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _serviceId = snapshotData['service_id'] as DocumentReference?;
    _slotDate = snapshotData['slot_date'] as DateTime?;
    _slotTime = snapshotData['slot_time'] as DateTime?;
    _capacity = castToType<int>(snapshotData['capacity']);
    _bookedCount = castToType<int>(snapshotData['booked_count']);
    _isAvailable = snapshotData['is_available'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment_slots');

  static Stream<AppointmentSlotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentSlotsRecord.fromSnapshot(s));

  static Future<AppointmentSlotsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppointmentSlotsRecord.fromSnapshot(s));

  static AppointmentSlotsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentSlotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentSlotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentSlotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentSlotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentSlotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentSlotsRecordData({
  DocumentReference? kioskId,
  DocumentReference? serviceId,
  DateTime? slotDate,
  DateTime? slotTime,
  int? capacity,
  int? bookedCount,
  bool? isAvailable,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'kiosk_id': kioskId,
      'service_id': serviceId,
      'slot_date': slotDate,
      'slot_time': slotTime,
      'capacity': capacity,
      'booked_count': bookedCount,
      'is_available': isAvailable,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentSlotsRecordDocumentEquality
    implements Equality<AppointmentSlotsRecord> {
  const AppointmentSlotsRecordDocumentEquality();

  @override
  bool equals(AppointmentSlotsRecord? e1, AppointmentSlotsRecord? e2) {
    return e1?.kioskId == e2?.kioskId &&
        e1?.serviceId == e2?.serviceId &&
        e1?.slotDate == e2?.slotDate &&
        e1?.slotTime == e2?.slotTime &&
        e1?.capacity == e2?.capacity &&
        e1?.bookedCount == e2?.bookedCount &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AppointmentSlotsRecord? e) => const ListEquality().hash([
        e?.kioskId,
        e?.serviceId,
        e?.slotDate,
        e?.slotTime,
        e?.capacity,
        e?.bookedCount,
        e?.isAvailable,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentSlotsRecord;
}
