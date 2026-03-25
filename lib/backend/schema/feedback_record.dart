import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "reference_type" field.
  NotificationsReferenceTypeEnum? _referenceType;
  NotificationsReferenceTypeEnum? get referenceType => _referenceType;
  bool hasReferenceType() => _referenceType != null;

  // "kiosk_id" field.
  DocumentReference? _kioskId;
  DocumentReference? get kioskId => _kioskId;
  bool hasKioskId() => _kioskId != null;

  // "service_id" field.
  DocumentReference? _serviceId;
  DocumentReference? get serviceId => _serviceId;
  bool hasServiceId() => _serviceId != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "ticket_id" field.
  DocumentReference? _ticketId;
  DocumentReference? get ticketId => _ticketId;
  bool hasTicketId() => _ticketId != null;

  // "appointment_id" field.
  DocumentReference? _appointmentId;
  DocumentReference? get appointmentId => _appointmentId;
  bool hasAppointmentId() => _appointmentId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _referenceType =
        snapshotData['reference_type'] is NotificationsReferenceTypeEnum
            ? snapshotData['reference_type']
            : deserializeEnum<NotificationsReferenceTypeEnum>(
                snapshotData['reference_type']);
    _kioskId = snapshotData['kiosk_id'] as DocumentReference?;
    _serviceId = snapshotData['service_id'] as DocumentReference?;
    _rating = castToType<int>(snapshotData['rating']);
    _comment = snapshotData['comment'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _ticketId = snapshotData['ticket_id'] as DocumentReference?;
    _appointmentId = snapshotData['appointment_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? userId,
  NotificationsReferenceTypeEnum? referenceType,
  DocumentReference? kioskId,
  DocumentReference? serviceId,
  int? rating,
  String? comment,
  DateTime? createdAt,
  DocumentReference? ticketId,
  DocumentReference? appointmentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'reference_type': referenceType,
      'kiosk_id': kioskId,
      'service_id': serviceId,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt,
      'ticket_id': ticketId,
      'appointment_id': appointmentId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.referenceType == e2?.referenceType &&
        e1?.kioskId == e2?.kioskId &&
        e1?.serviceId == e2?.serviceId &&
        e1?.rating == e2?.rating &&
        e1?.comment == e2?.comment &&
        e1?.createdAt == e2?.createdAt &&
        e1?.ticketId == e2?.ticketId &&
        e1?.appointmentId == e2?.appointmentId;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.referenceType,
        e?.kioskId,
        e?.serviceId,
        e?.rating,
        e?.comment,
        e?.createdAt,
        e?.ticketId,
        e?.appointmentId
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
