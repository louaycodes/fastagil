import 'package:collection/collection.dart';

enum OtpVerificationsPurposeEnum {
  REGISTER,
  LOGIN,
  RESET_PASSWORD,
}

enum KioskStatusEnum {
  ACTIVE,
  INACTIVE,
  MAINTENANCE,
}

enum ServicesCodeEnum {
  ELECTRONIC_CARD,
  TICKET_BOOKLET,
  VOUCHER,
}

enum QueuesStatusEnum {
  OPEN,
  PAUSED,
  CLOSED,
}

enum TicketStatusEnum {
  WAITING,
  CALLED,
  IN_SERVICE,
  DONE,
  CANCELLED,
  NO_SHOW,
}

enum AppointmentsStatusEnum {
  CONFIRMED,
  CANCELLED,
  DONE,
  NO_SHOW,
}

enum NotificationsTypeEnum {
  TICKET_CALLED,
  TURN_SOON,
  APPOINTMENT_REMINDER,
  APPOINTMENT_CONFIRMED,
  TICKET_CANCELLED,
  SYSTEM,
}

enum NotificationsReferenceTypeEnum {
  TICKET,
  APPOINTMENT,
}

enum NotifictionPlateformeEnum {
  ANDROID,
  IOS,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (OtpVerificationsPurposeEnum):
      return OtpVerificationsPurposeEnum.values.deserialize(value) as T?;
    case (KioskStatusEnum):
      return KioskStatusEnum.values.deserialize(value) as T?;
    case (ServicesCodeEnum):
      return ServicesCodeEnum.values.deserialize(value) as T?;
    case (QueuesStatusEnum):
      return QueuesStatusEnum.values.deserialize(value) as T?;
    case (TicketStatusEnum):
      return TicketStatusEnum.values.deserialize(value) as T?;
    case (AppointmentsStatusEnum):
      return AppointmentsStatusEnum.values.deserialize(value) as T?;
    case (NotificationsTypeEnum):
      return NotificationsTypeEnum.values.deserialize(value) as T?;
    case (NotificationsReferenceTypeEnum):
      return NotificationsReferenceTypeEnum.values.deserialize(value) as T?;
    case (NotifictionPlateformeEnum):
      return NotifictionPlateformeEnum.values.deserialize(value) as T?;
    default:
      return null;
  }
}
