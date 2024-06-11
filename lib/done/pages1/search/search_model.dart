import '/backend/backend.dart';
import '/done/pages1/navbar/navbar_widget.dart';
import '/done/popup_search/popup_search_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchbar widget.
  FocusNode? searchbarFocusNode;
  TextEditingController? searchbarTextController;
  String? Function(BuildContext, String?)? searchbarTextControllerValidator;
  List<PostsRecord> simpleSearchResults1 = [];
  // State field(s) for searchtalents widget.
  FocusNode? searchtalentsFocusNode;
  TextEditingController? searchtalentsTextController;
  String? Function(BuildContext, String?)? searchtalentsTextControllerValidator;
  List<UsersRecord> simpleSearchResults2 = [];
  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchbarFocusNode?.dispose();
    searchbarTextController?.dispose();

    searchtalentsFocusNode?.dispose();
    searchtalentsTextController?.dispose();

    navbarModel.dispose();
  }
}
