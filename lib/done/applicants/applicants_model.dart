import '/backend/backend.dart';
import '/components/job_status/job_status_widget.dart';
import '/components/payment_reminder/payment_reminder_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'applicants_widget.dart' show ApplicantsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ApplicantsModel extends FlutterFlowModel<ApplicantsWidget> {
  ///  Local state fields for this page.

  String filter = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for searc widget.
  FocusNode? searcFocusNode;
  TextEditingController? searcTextController;
  String? Function(BuildContext, String?)? searcTextControllerValidator;
  List<ApplicationsRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searcFocusNode?.dispose();
    searcTextController?.dispose();
  }
}
