import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'newpost_widget.dart' show NewpostWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NewpostModel extends FlutterFlowModel<NewpostWidget> {
  ///  Local state fields for this page.

  DateTime? eventdate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for header widget.
  FocusNode? headerFocusNode;
  TextEditingController? headerTextController;
  String? Function(BuildContext, String?)? headerTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in talents widget.
  PostsRecord? newpost;
  DateTime? datePicked;

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
