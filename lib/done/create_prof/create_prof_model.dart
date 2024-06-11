import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'create_prof_widget.dart' show CreateProfWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfModel extends FlutterFlowModel<CreateProfWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  String? _fnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter firstname';
    }

    return null;
  }

  // State field(s) for lname widget.
  FocusNode? lnameFocusNode;
  TextEditingController? lnameTextController;
  String? Function(BuildContext, String?)? lnameTextControllerValidator;
  String? _lnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter last name';
    }

    return null;
  }

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;
  // State field(s) for pnumber widget.
  FocusNode? pnumberFocusNode;
  TextEditingController? pnumberTextController;
  String? Function(BuildContext, String?)? pnumberTextControllerValidator;
  String? _pnumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter phone number';
    }

    if (val.length < 11) {
      return 'Atleast 11 characters allowed';
    }

    return null;
  }

  // State field(s) for Classification widget.
  List<String>? classificationValue;
  FormFieldController<List<String>>? classificationValueController;

  @override
  void initState(BuildContext context) {
    fnameTextControllerValidator = _fnameTextControllerValidator;
    lnameTextControllerValidator = _lnameTextControllerValidator;
    pnumberTextControllerValidator = _pnumberTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();

    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    bioFocusNode?.dispose();
    bioTextController?.dispose();

    pnumberFocusNode?.dispose();
    pnumberTextController?.dispose();
  }
}
