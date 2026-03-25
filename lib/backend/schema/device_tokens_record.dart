import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceTokensRecord extends FirestoreRecord {
  DeviceTokensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "platform" field.
  NotifictionPlateformeEnum? _platform;
  NotifictionPlateformeEnum? get platform => _platform;
  bool hasPlatform() => _platform != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "last_used_at" field.
  DateTime? _lastUsedAt;
  DateTime? get lastUsedAt => _lastUsedAt;
  bool hasLastUsedAt() => _lastUsedAt != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _token = snapshotData['token'] as String?;
    _platform = snapshotData['platform'] is NotifictionPlateformeEnum
        ? snapshotData['platform']
        : deserializeEnum<NotifictionPlateformeEnum>(snapshotData['platform']);
    _isActive = snapshotData['is_active'] as bool?;
    _lastUsedAt = snapshotData['last_used_at'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('device_tokens');

  static Stream<DeviceTokensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeviceTokensRecord.fromSnapshot(s));

  static Future<DeviceTokensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeviceTokensRecord.fromSnapshot(s));

  static DeviceTokensRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeviceTokensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeviceTokensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeviceTokensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeviceTokensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceTokensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeviceTokensRecordData({
  DocumentReference? userId,
  String? token,
  NotifictionPlateformeEnum? platform,
  bool? isActive,
  DateTime? lastUsedAt,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'token': token,
      'platform': platform,
      'is_active': isActive,
      'last_used_at': lastUsedAt,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeviceTokensRecordDocumentEquality
    implements Equality<DeviceTokensRecord> {
  const DeviceTokensRecordDocumentEquality();

  @override
  bool equals(DeviceTokensRecord? e1, DeviceTokensRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.token == e2?.token &&
        e1?.platform == e2?.platform &&
        e1?.isActive == e2?.isActive &&
        e1?.lastUsedAt == e2?.lastUsedAt &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(DeviceTokensRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.token,
        e?.platform,
        e?.isActive,
        e?.lastUsedAt,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceTokensRecord;
}
