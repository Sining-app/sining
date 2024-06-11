import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'notif_preference_widget.dart' show NotifPreferenceWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotifPreferenceModel extends FlutterFlowModel<NotifPreferenceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
