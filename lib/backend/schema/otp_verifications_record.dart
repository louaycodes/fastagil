import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OtpVerificationsRecord extends FirestoreRecord {
  OtpVerificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "is_used" field.
  String? _isUsed;
  String get isUsed => _isUsed ?? '';
  bool hasIsUsed() => _isUsed != null;

  // "expires_at" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "purpose" field.
  OtpVerificationsPurposeEnum? _purpose;
  OtpVerificationsPurposeEnum? get purpose => _purpose;
  bool hasPurpose() => _purpose != null;

  void _initializeFields() {
    _phone = snapshotData['phone'] as String?;
    _code = snapshotData['code'] as String?;
    _isUsed = snapshotData['is_used'] as String?;
    _expiresAt = snapshotData['expires_at'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _purpose = snapshotData['purpose'] is OtpVerificationsPurposeEnum
        ? snapshotData['purpose']
        : deserializeEnum<OtpVerificationsPurposeEnum>(snapshotData['purpose']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('otp_verifications');

  static Stream<OtpVerificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OtpVerificationsRecord.fromSnapshot(s));

  static Future<OtpVerificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OtpVerificationsRecord.fromSnapshot(s));

  static OtpVerificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OtpVerificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OtpVerificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OtpVerificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OtpVerificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OtpVerificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOtpVerificationsRecordData({
  String? phone,
  String? code,
  String? isUsed,
  DateTime? expiresAt,
  DateTime? createdAt,
  OtpVerificationsPurposeEnum? purpose,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phone': phone,
      'code': code,
      'is_used': isUsed,
      'expires_at': expiresAt,
      'created_at': createdAt,
      'purpose': purpose,
    }.withoutNulls,
  );

  return firestoreData;
}

class OtpVerificationsRecordDocumentEquality
    implements Equality<OtpVerificationsRecord> {
  const OtpVerificationsRecordDocumentEquality();

  @override
  bool equals(OtpVerificationsRecord? e1, OtpVerificationsRecord? e2) {
    return e1?.phone == e2?.phone &&
        e1?.code == e2?.code &&
        e1?.isUsed == e2?.isUsed &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.purpose == e2?.purpose;
  }

  @override
  int hash(OtpVerificationsRecord? e) => const ListEquality().hash(
      [e?.phone, e?.code, e?.isUsed, e?.expiresAt, e?.createdAt, e?.purpose]);

  @override
  bool isValidKey(Object? o) => o is OtpVerificationsRecord;
}
