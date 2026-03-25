import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueuesRecord extends FirestoreRecord {
  QueuesRecord._(
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

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  QueuesStatusEnum? _status;
  QueuesStatusEnum? get status => _status;
  bool hasStatus() => _status != null;

  // "current_ticket_number" field.
  int? _currentTicketNumber;
  int get currentTicketNumber => _currentTicketNumber ?? 0;
  bool hasCurrentTicketNumber() => _currentTicketNumber != null;

  // "last_ticket_number" field.
  int? _lastTicketNumber;
  int get lastTicketNumber => _lastTicketNumber ?? 0;
  bool hasLastTicketNumber() => _lastTicketNumber != null;

  // "opened_at" field.
  DateTime? _openedAt;
  DateTime? get openedAt => _openedAt;
  bool hasOpenedAt() => _openedAt != null;

  // "closed_at" field.
  DateTime? _closedAt;
  DateTime? get closedAt => _closedAt;
  bool hasClosedAt() => _closedAt != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _serviceId = snapshotData['service_id'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] is QueuesStatusEnum
        ? snapshotData['status']
        : deserializeEnum<QueuesStatusEnum>(snapshotData['status']);
    _currentTicketNumber =
        castToType<int>(snapshotData['current_ticket_number']);
    _lastTicketNumber = castToType<int>(snapshotData['last_ticket_number']);
    _openedAt = snapshotData['opened_at'] as DateTime?;
    _closedAt = snapshotData['closed_at'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('queues');

  static Stream<QueuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QueuesRecord.fromSnapshot(s));

  static Future<QueuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QueuesRecord.fromSnapshot(s));

  static QueuesRecord fromSnapshot(DocumentSnapshot snapshot) => QueuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QueuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QueuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QueuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QueuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQueuesRecordData({
  DocumentReference? kioskId,
  DocumentReference? serviceId,
  DateTime? date,
  QueuesStatusEnum? status,
  int? currentTicketNumber,
  int? lastTicketNumber,
  DateTime? openedAt,
  DateTime? closedAt,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'kiosk_id': kioskId,
      'service_id': serviceId,
      'date': date,
      'status': status,
      'current_ticket_number': currentTicketNumber,
      'last_ticket_number': lastTicketNumber,
      'opened_at': openedAt,
      'closed_at': closedAt,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class QueuesRecordDocumentEquality implements Equality<QueuesRecord> {
  const QueuesRecordDocumentEquality();

  @override
  bool equals(QueuesRecord? e1, QueuesRecord? e2) {
    return e1?.kioskId == e2?.kioskId &&
        e1?.serviceId == e2?.serviceId &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.currentTicketNumber == e2?.currentTicketNumber &&
        e1?.lastTicketNumber == e2?.lastTicketNumber &&
        e1?.openedAt == e2?.openedAt &&
        e1?.closedAt == e2?.closedAt &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(QueuesRecord? e) => const ListEquality().hash([
        e?.kioskId,
        e?.serviceId,
        e?.date,
        e?.status,
        e?.currentTicketNumber,
        e?.lastTicketNumber,
        e?.openedAt,
        e?.closedAt,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is QueuesRecord;
}
