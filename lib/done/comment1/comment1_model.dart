import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment1_widget.dart' show Comment1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Comment1Model extends FlutterFlowModel<Comment1Widget> {
  ///  Local state fields for this component.

  bool isliked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Comment1 widget.
  CommentlikeRecord? commentlike;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
