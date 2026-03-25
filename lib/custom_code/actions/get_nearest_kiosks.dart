// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;

Future<List<KiosksRecord>> getNearestKiosks() async {
  const double userLat = 37.2746;
  const double userLng = 9.8739;

  double dist(double lat2, double lng2) {
    const R = 6371.0;
    final dLat = (lat2 - userLat) * math.pi / 180;
    final dLng = (lng2 - userLng) * math.pi / 180;
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(userLat * math.pi / 180) *
            math.cos(lat2 * math.pi / 180) *
            math.sin(dLng / 2) *
            math.sin(dLng / 2);
    return R * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }

  final snapshot = await FirebaseFirestore.instance.collection('kiosks').get();
  final kiosks =
      snapshot.docs.map((d) => KiosksRecord.fromSnapshot(d)).toList();
  kiosks.sort((a, b) =>
      dist(a.latitude, a.longitude).compareTo(dist(b.latitude, b.longitude)));
  return kiosks.take(3).toList();
}
