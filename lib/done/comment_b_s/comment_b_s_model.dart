import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/done/comment1/comment1_widget.dart';
import '/done/comment_reply/comment_reply_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_b_s_widget.dart' show CommentBSWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentBSModel extends FlutterFlowModel<CommentBSWidget> {
  ///  Local state fields for this component.

  DocumentReference? replytocomment;

  bool isReplytoReply = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for typecomment widget.
  FocusNode? typecommentFocusNode;
  TextEditingController? typecommentTextController;
  String? Function(BuildContext, String?)? typecommentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    typecommentFocusNode?.dispose();
    typecommentTextController?.dispose();
  }
}
