import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "queue_id" field.
  DocumentReference? _queueId;
  DocumentReference? get queueId => _queueId;
  bool hasQueueId() => _queueId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "kiosk_id" field.
  DocumentReference? _kioskId;
  DocumentReference? get kioskId => _kioskId;
  bool hasKioskId() => _kioskId != null;

  // "ticket_number" field.
  int? _ticketNumber;
  int get ticketNumber => _ticketNumber ?? 0;
  bool hasTicketNumber() => _ticketNumber != null;

  // "display_code" field.
  String? _displayCode;
  String get displayCode => _displayCode ?? '';
  bool hasDisplayCode() => _displayCode != null;

  // "qr_code_data" field.
  String? _qrCodeData;
  String get qrCodeData => _qrCodeData ?? '';
  bool hasQrCodeData() => _qrCodeData != null;

  // "status" field.
  TicketStatusEnum? _status;
  TicketStatusEnum? get status => _status;
  bool hasStatus() => _status != null;

  // "position_in_queue" field.
  int? _positionInQueue;
  int get positionInQueue => _positionInQueue ?? 0;
  bool hasPositionInQueue() => _positionInQueue != null;

  // "estimated_wait_minutes" field.
  int? _estimatedWaitMinutes;
  int get estimatedWaitMinutes => _estimatedWaitMinutes ?? 0;
  bool hasEstimatedWaitMinutes() => _estimatedWaitMinutes != null;

  // "called_at" field.
  DateTime? _calledAt;
  DateTime? get calledAt => _calledAt;
  bool hasCalledAt() => _calledAt != null;

  // "served_at" field.
  DateTime? _servedAt;
  DateTime? get servedAt => _servedAt;
  bool hasServedAt() => _servedAt != null;

  // "done_at" field.
  DateTime? _doneAt;
  DateTime? get doneAt => _doneAt;
  bool hasDoneAt() => _doneAt != null;

  // "cancelled_at" field.
  DateTime? _cancelledAt;
  DateTime? get cancelledAt => _cancelledAt;
  bool hasCancelledAt() => _cancelledAt != null;

  // "cancel_reason" field.
  String? _cancelReason;
  String get cancelReason => _cancelReason ?? '';
  bool hasCancelReason() => _cancelReason != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "service_id" field.
  String? _serviceId;
  String get serviceId => _serviceId ?? '';
  bool hasServiceId() => _serviceId != null;

  void _initializeFields() {
    _queueId = snapshotData['queue_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _ticketNumber = castToType<int>(snapshotData['ticket_number']);
    _displayCode = snapshotData['display_code'] as String?;
    _qrCodeData = snapshotData['qr_code_data'] as String?;
    _status = snapshotData['status'] is TicketStatusEnum
        ? snapshotData['status']
        : deserializeEnum<TicketStatusEnum>(snapshotData['status']);
    _positionInQueue = castToType<int>(snapshotData['position_in_queue']);
    _estimatedWaitMinutes =
        castToType<int>(snapshotData['estimated_wait_minutes']);
    _calledAt = snapshotData['called_at'] as DateTime?;
    _servedAt = snapshotData['served_at'] as DateTime?;
    _doneAt = snapshotData['done_at'] as DateTime?;
    _cancelledAt = snapshotData['cancelled_at'] as DateTime?;
    _cancelReason = snapshotData['cancel_reason'] as String?;
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _serviceId = snapshotData['service_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tickets');

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  DocumentReference? queueId,
  DocumentReference? userId,
  DocumentReference? kioskId,
  int? ticketNumber,
  String? displayCode,
  String? qrCodeData,
  TicketStatusEnum? status,
  int? positionInQueue,
  int? estimatedWaitMinutes,
  DateTime? calledAt,
  DateTime? servedAt,
  DateTime? doneAt,
  DateTime? cancelledAt,
  String? cancelReason,
  String? notes,
  DateTime? createdAt,
  String? serviceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'queue_id': queueId,
      'user_id': userId,
      'kiosk_id': kioskId,
      'ticket_number': ticketNumber,
      'display_code': displayCode,
      'qr_code_data': qrCodeData,
      'status': status,
      'position_in_queue': positionInQueue,
      'estimated_wait_minutes': estimatedWaitMinutes,
      'called_at': calledAt,
      'served_at': servedAt,
      'done_at': doneAt,
      'cancelled_at': cancelledAt,
      'cancel_reason': cancelReason,
      'notes': notes,
      'created_at': createdAt,
      'service_id': serviceId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    return e1?.queueId == e2?.queueId &&
        e1?.userId == e2?.userId &&
        e1?.kioskId == e2?.kioskId &&
        e1?.ticketNumber == e2?.ticketNumber &&
        e1?.displayCode == e2?.displayCode &&
        e1?.qrCodeData == e2?.qrCodeData &&
        e1?.status == e2?.status &&
        e1?.positionInQueue == e2?.positionInQueue &&
        e1?.estimatedWaitMinutes == e2?.estimatedWaitMinutes &&
        e1?.calledAt == e2?.calledAt &&
        e1?.servedAt == e2?.servedAt &&
        e1?.doneAt == e2?.doneAt &&
        e1?.cancelledAt == e2?.cancelledAt &&
        e1?.cancelReason == e2?.cancelReason &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.serviceId == e2?.serviceId;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality().hash([
        e?.queueId,
        e?.userId,
        e?.kioskId,
        e?.ticketNumber,
        e?.displayCode,
        e?.qrCodeData,
        e?.status,
        e?.positionInQueue,
        e?.estimatedWaitMinutes,
        e?.calledAt,
        e?.servedAt,
        e?.doneAt,
        e?.cancelledAt,
        e?.cancelReason,
        e?.notes,
        e?.createdAt,
        e?.serviceId
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
