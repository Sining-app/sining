import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'u_a_likes_widget.dart' show UALikesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class UALikesModel extends FlutterFlowModel<UALikesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, LikeRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, LikeRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, LikeRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, LikeRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryLikeRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
