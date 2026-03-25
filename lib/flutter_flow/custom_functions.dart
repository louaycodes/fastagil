import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? distanceBetween(
  double lat,
  double? lng,
) {
  if (lng == null) return null;

  // Coordonnées fixes : Bizerte, Tunisie
  const double userLat = 37.2746;
  const double userLng = 9.8739;

  const R = 6371.0;
  final lat1 = userLat * math.pi / 180;
  final lat2 = lat * math.pi / 180;
  final dLat = (lat - userLat) * math.pi / 180;
  final dLng = (lng - userLng) * math.pi / 180;

  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLng / 2) * math.sin(dLng / 2);

  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return double.parse((R * c).toStringAsFixed(1));
}

int? generateTicketNumber() {
  final now = DateTime.now();
  return int.parse("${now.hour}${now.minute}${now.second}");
}

double? calculateestimatedwaitingTime(
  double position,
  double avgDuration,
) {
  return position * avgDuration;
}

List<String> generateTimeSlots() {
  List<String> slots = [];
  for (int h = 0; h < 24; h++) {
    slots.add("${h.toString().padLeft(2, '0')}:00");
    slots.add("${h.toString().padLeft(2, '0')}:30");
  }
  return slots;
}
