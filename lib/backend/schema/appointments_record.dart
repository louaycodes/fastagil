import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "kiosk_id" field.
  DocumentReference? _kioskId;
  DocumentReference? get kioskId => _kioskId;
  bool hasKioskId() => _kioskId != null;

  // "appointment_date" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "display_code" field.
  String? _displayCode;
  String get displayCode => _displayCode ?? '';
  bool hasDisplayCode() => _displayCode != null;

  // "qr_code_data" field.
  String? _qrCodeData;
  String get qrCodeData => _qrCodeData ?? '';
  bool hasQrCodeData() => _qrCodeData != null;

  // "status" field.
  AppointmentsStatusEnum? _status;
  AppointmentsStatusEnum? get status => _status;
  bool hasStatus() => _status != null;

  // "reminder_sent_day_before" field.
  bool? _reminderSentDayBefore;
  bool get reminderSentDayBefore => _reminderSentDayBefore ?? false;
  bool hasReminderSentDayBefore() => _reminderSentDayBefore != null;

  // "reminder_sent_hour_before" field.
  bool? _reminderSentHourBefore;
  bool get reminderSentHourBefore => _reminderSentHourBefore ?? false;
  bool hasReminderSentHourBefore() => _reminderSentHourBefore != null;

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

  // "slot_id" field.
  String? _slotId;
  String get slotId => _slotId ?? '';
  bool hasSlotId() => _slotId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _appointmentDate = snapshotData['appointment_date'] as DateTime?;
    _displayCode = snapshotData['display_code'] as String?;
    _qrCodeData = snapshotData['qr_code_data'] as String?;
    _status = snapshotData['status'] is AppointmentsStatusEnum
        ? snapshotData['status']
        : deserializeEnum<AppointmentsStatusEnum>(snapshotData['status']);
    _reminderSentDayBefore = snapshotData['reminder_sent_day_before'] as bool?;
    _reminderSentHourBefore =
        snapshotData['reminder_sent_hour_before'] as bool?;
    _cancelledAt = snapshotData['cancelled_at'] as DateTime?;
    _cancelReason = snapshotData['cancel_reason'] as String?;
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _serviceId = snapshotData['service_id'] as String?;
    _slotId = snapshotData['slot_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  DocumentReference? userId,
  DocumentReference? kioskId,
  DateTime? appointmentDate,
  String? displayCode,
  String? qrCodeData,
  AppointmentsStatusEnum? status,
  bool? reminderSentDayBefore,
  bool? reminderSentHourBefore,
  DateTime? cancelledAt,
  String? cancelReason,
  String? notes,
  DateTime? createdAt,
  String? serviceId,
  String? slotId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'kiosk_id': kioskId,
      'appointment_date': appointmentDate,
      'display_code': displayCode,
      'qr_code_data': qrCodeData,
      'status': status,
      'reminder_sent_day_before': reminderSentDayBefore,
      'reminder_sent_hour_before': reminderSentHourBefore,
      'cancelled_at': cancelledAt,
      'cancel_reason': cancelReason,
      'notes': notes,
      'created_at': createdAt,
      'service_id': serviceId,
      'slot_id': slotId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.kioskId == e2?.kioskId &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.displayCode == e2?.displayCode &&
        e1?.qrCodeData == e2?.qrCodeData &&
        e1?.status == e2?.status &&
        e1?.reminderSentDayBefore == e2?.reminderSentDayBefore &&
        e1?.reminderSentHourBefore == e2?.reminderSentHourBefore &&
        e1?.cancelledAt == e2?.cancelledAt &&
        e1?.cancelReason == e2?.cancelReason &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.serviceId == e2?.serviceId &&
        e1?.slotId == e2?.slotId;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.kioskId,
        e?.appointmentDate,
        e?.displayCode,
        e?.qrCodeData,
        e?.status,
        e?.reminderSentDayBefore,
        e?.reminderSentHourBefore,
        e?.cancelledAt,
        e?.cancelReason,
        e?.notes,
        e?.createdAt,
        e?.serviceId,
        e?.slotId
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
