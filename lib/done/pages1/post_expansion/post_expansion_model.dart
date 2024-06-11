import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/done/comment_b_s/comment_b_s_widget.dart';
import '/done/p_o_other_user/p_o_other_user_widget.dart';
import '/done/p_o_the_user/p_o_the_user_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'post_expansion_widget.dart' show PostExpansionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PostExpansionModel extends FlutterFlowModel<PostExpansionWidget> {
  ///  Local state fields for this page.

  bool isReplytoReply = false;

  DocumentReference? replytocomment;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
