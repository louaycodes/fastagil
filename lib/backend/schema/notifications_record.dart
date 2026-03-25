import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "type" field.
  NotificationsTypeEnum? _type;
  NotificationsTypeEnum? get type => _type;
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "reference_type" field.
  NotificationsReferenceTypeEnum? _referenceType;
  NotificationsReferenceTypeEnum? get referenceType => _referenceType;
  bool hasReferenceType() => _referenceType != null;

  // "ticket_id" field.
  DocumentReference? _ticketId;
  DocumentReference? get ticketId => _ticketId;
  bool hasTicketId() => _ticketId != null;

  // "appointment_id" field.
  DocumentReference? _appointmentId;
  DocumentReference? get appointmentId => _appointmentId;
  bool hasAppointmentId() => _appointmentId != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "sent_at" field.
  DateTime? _sentAt;
  DateTime? get sentAt => _sentAt;
  bool hasSentAt() => _sentAt != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _type = snapshotData['type'] is NotificationsTypeEnum
        ? snapshotData['type']
        : deserializeEnum<NotificationsTypeEnum>(snapshotData['type']);
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _referenceType =
        snapshotData['reference_type'] is NotificationsReferenceTypeEnum
            ? snapshotData['reference_type']
            : deserializeEnum<NotificationsReferenceTypeEnum>(
                snapshotData['reference_type']);
    _ticketId = snapshotData['ticket_id'] as DocumentReference?;
    _appointmentId = snapshotData['appointment_id'] as DocumentReference?;
    _isRead = snapshotData['is_read'] as bool?;
    _sentAt = snapshotData['sent_at'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? userId,
  NotificationsTypeEnum? type,
  String? title,
  String? body,
  NotificationsReferenceTypeEnum? referenceType,
  DocumentReference? ticketId,
  DocumentReference? appointmentId,
  bool? isRead,
  DateTime? sentAt,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'type': type,
      'title': title,
      'body': body,
      'reference_type': referenceType,
      'ticket_id': ticketId,
      'appointment_id': appointmentId,
      'is_read': isRead,
      'sent_at': sentAt,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.referenceType == e2?.referenceType &&
        e1?.ticketId == e2?.ticketId &&
        e1?.appointmentId == e2?.appointmentId &&
        e1?.isRead == e2?.isRead &&
        e1?.sentAt == e2?.sentAt &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.type,
        e?.title,
        e?.body,
        e?.referenceType,
        e?.ticketId,
        e?.appointmentId,
        e?.isRead,
        e?.sentAt,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
