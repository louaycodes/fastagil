import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/pas_de_r_d_v_actif/pas_de_r_d_v_actif_widget.dart';
import '/utils/pas_de_ticket_actif/pas_de_ticket_actif_widget.dart';
import '/walkthroughs/home_walkthrough.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<KiosksRecord> kiosquesLesPlusProches = [];
  void addToKiosquesLesPlusProches(KiosksRecord item) =>
      kiosquesLesPlusProches.add(item);
  void removeFromKiosquesLesPlusProches(KiosksRecord item) =>
      kiosquesLesPlusProches.remove(item);
  void removeAtIndexFromKiosquesLesPlusProches(int index) =>
      kiosquesLesPlusProches.removeAt(index);
  void insertAtIndexInKiosquesLesPlusProches(int index, KiosksRecord item) =>
      kiosquesLesPlusProches.insert(index, item);
  void updateKiosquesLesPlusProchesAtIndex(
          int index, Function(KiosksRecord) updateFn) =>
      kiosquesLesPlusProches[index] = updateFn(kiosquesLesPlusProches[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeWalkthroughController;
  // Stores action output result for [Custom Action - getNearestKiosks] action in Home widget.
  List<KiosksRecord>? listDeskiosques;
  // Model for pasDeTicketActif component.
  late PasDeTicketActifModel pasDeTicketActifModel;
  // Model for pasDeRDVActif component.
  late PasDeRDVActifModel pasDeRDVActifModel;

  @override
  void initState(BuildContext context) {
    pasDeTicketActifModel = createModel(context, () => PasDeTicketActifModel());
    pasDeRDVActifModel = createModel(context, () => PasDeRDVActifModel());
  }

  @override
  void dispose() {
    homeWalkthroughController?.finish();
    pasDeTicketActifModel.dispose();
    pasDeRDVActifModel.dispose();
  }
}
