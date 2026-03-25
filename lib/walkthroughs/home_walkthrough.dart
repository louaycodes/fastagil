import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/utils/walkthrough_component/walkthrough_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerK73mlwdn = GlobalKey();
final container2yl5smjh = GlobalKey();
final row0oc1zfl4 = GlobalKey();
final listViewF70ij6qa = GlobalKey();

/// homeWalkthrough
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerK73mlwdn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughComponentWidget(
              explication:
                  'Si vous rejoinderiez la queue dans une kiosque, vous trouveriez votre ticket ici',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: container2yl5smjh,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughComponentWidget(
              explication:
                  'Si vous prenez un rendez-vous dans une kiosque, vous trouveriez les détails ici',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: row0oc1zfl4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughComponentWidget(
              explication:
                  'Joingnez la queue ou résérvez u crénaut rapidement ici',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: listViewF70ij6qa,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughComponentWidget(
              explication:
                  'Ici vous trouveriez les kiosques les plus proches de vous',
            ),
          ),
        ],
      ),
    ];
