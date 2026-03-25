import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_profile_picture_widget.dart' show AddProfilePictureWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProfilePictureModel extends FlutterFlowModel<AddProfilePictureWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataOem = false;
  FFUploadedFile uploadedLocalFile_uploadDataOem =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (CloudinaryAPI)] action in Button widget.
  ApiCallResponse? cloudinaryOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
