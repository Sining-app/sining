import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for available widget.
  String? availableValue;
  FormFieldController<String>? availableValueController;
  // State field(s) for header widget.
  FocusNode? headerFocusNode;
  TextEditingController? headerTextController;
  String? Function(BuildContext, String?)? headerTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for posttype widget.
  String? posttypeValue;
  FormFieldController<String>? posttypeValueController;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in talents widget.
  List<ApplicationsRecord>? notif;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    headerFocusNode?.dispose();
    headerTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
