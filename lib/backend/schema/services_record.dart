import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "label_fr" field.
  String? _labelFr;
  String get labelFr => _labelFr ?? '';
  bool hasLabelFr() => _labelFr != null;

  // "label_ar" field.
  String? _labelAr;
  String get labelAr => _labelAr ?? '';
  bool hasLabelAr() => _labelAr != null;

  // "code" field.
  ServicesCodeEnum? _code;
  ServicesCodeEnum? get code => _code;
  bool hasCode() => _code != null;

  // "description_fr" field.
  String? _descriptionFr;
  String get descriptionFr => _descriptionFr ?? '';
  bool hasDescriptionFr() => _descriptionFr != null;

  // "description_ar" field.
  String? _descriptionAr;
  String get descriptionAr => _descriptionAr ?? '';
  bool hasDescriptionAr() => _descriptionAr != null;

  // "icon_url" field.
  String? _iconUrl;
  String get iconUrl => _iconUrl ?? '';
  bool hasIconUrl() => _iconUrl != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "estimated_duration_minutes" field.
  int? _estimatedDurationMinutes;
  int get estimatedDurationMinutes => _estimatedDurationMinutes ?? 0;
  bool hasEstimatedDurationMinutes() => _estimatedDurationMinutes != null;

  void _initializeFields() {
    _labelFr = snapshotData['label_fr'] as String?;
    _labelAr = snapshotData['label_ar'] as String?;
    _code = snapshotData['code'] is ServicesCodeEnum
        ? snapshotData['code']
        : deserializeEnum<ServicesCodeEnum>(snapshotData['code']);
    _descriptionFr = snapshotData['description_fr'] as String?;
    _descriptionAr = snapshotData['description_ar'] as String?;
    _iconUrl = snapshotData['icon_url'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _estimatedDurationMinutes =
        castToType<int>(snapshotData['estimated_duration_minutes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? labelFr,
  String? labelAr,
  ServicesCodeEnum? code,
  String? descriptionFr,
  String? descriptionAr,
  String? iconUrl,
  bool? isActive,
  int? estimatedDurationMinutes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'label_fr': labelFr,
      'label_ar': labelAr,
      'code': code,
      'description_fr': descriptionFr,
      'description_ar': descriptionAr,
      'icon_url': iconUrl,
      'is_active': isActive,
      'estimated_duration_minutes': estimatedDurationMinutes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.labelFr == e2?.labelFr &&
        e1?.labelAr == e2?.labelAr &&
        e1?.code == e2?.code &&
        e1?.descriptionFr == e2?.descriptionFr &&
        e1?.descriptionAr == e2?.descriptionAr &&
        e1?.iconUrl == e2?.iconUrl &&
        e1?.isActive == e2?.isActive &&
        e1?.estimatedDurationMinutes == e2?.estimatedDurationMinutes;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.labelFr,
        e?.labelAr,
        e?.code,
        e?.descriptionFr,
        e?.descriptionAr,
        e?.iconUrl,
        e?.isActive,
        e?.estimatedDurationMinutes
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
