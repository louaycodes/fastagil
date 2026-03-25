import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KiosksRecord extends FirestoreRecord {
  KiosksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "working_days" field.
  String? _workingDays;
  String get workingDays => _workingDays ?? '';
  bool hasWorkingDays() => _workingDays != null;

  // "max_queue_capacity" field.
  int? _maxQueueCapacity;
  int get maxQueueCapacity => _maxQueueCapacity ?? 0;
  bool hasMaxQueueCapacity() => _maxQueueCapacity != null;

  // "avg_service_duration_minutes" field.
  int? _avgServiceDurationMinutes;
  int get avgServiceDurationMinutes => _avgServiceDurationMinutes ?? 0;
  bool hasAvgServiceDurationMinutes() => _avgServiceDurationMinutes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _phone = snapshotData['phone'] as String?;
    _workingDays = snapshotData['working_days'] as String?;
    _maxQueueCapacity = castToType<int>(snapshotData['max_queue_capacity']);
    _avgServiceDurationMinutes =
        castToType<int>(snapshotData['avg_service_duration_minutes']);
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kiosks');

  static Stream<KiosksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KiosksRecord.fromSnapshot(s));

  static Future<KiosksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KiosksRecord.fromSnapshot(s));

  static KiosksRecord fromSnapshot(DocumentSnapshot snapshot) => KiosksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KiosksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KiosksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KiosksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KiosksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKiosksRecordData({
  String? name,
  String? address,
  double? latitude,
  double? longitude,
  String? phone,
  String? workingDays,
  int? maxQueueCapacity,
  int? avgServiceDurationMinutes,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'working_days': workingDays,
      'max_queue_capacity': maxQueueCapacity,
      'avg_service_duration_minutes': avgServiceDurationMinutes,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class KiosksRecordDocumentEquality implements Equality<KiosksRecord> {
  const KiosksRecordDocumentEquality();

  @override
  bool equals(KiosksRecord? e1, KiosksRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.phone == e2?.phone &&
        e1?.workingDays == e2?.workingDays &&
        e1?.maxQueueCapacity == e2?.maxQueueCapacity &&
        e1?.avgServiceDurationMinutes == e2?.avgServiceDurationMinutes &&
        e1?.status == e2?.status;
  }

  @override
  int hash(KiosksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.latitude,
        e?.longitude,
        e?.phone,
        e?.workingDays,
        e?.maxQueueCapacity,
        e?.avgServiceDurationMinutes,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is KiosksRecord;
}
