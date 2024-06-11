import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment1_model.dart';
export 'comment1_model.dart';

class Comment1Widget extends StatefulWidget {
  const Comment1Widget({
    super.key,
    required this.comment,
    required this.user,
  });

  final CommentRecord? comment;
  final UsersRecord? user;

  @override
  State<Comment1Widget> createState() => _Comment1WidgetState();
}

class _Comment1WidgetState extends State<Comment1Widget> {
  late Comment1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Comment1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.commentlike = await queryCommentlikeRecordOnce(
        queryBuilder: (commentlikeRecord) => commentlikeRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'comment',
              isEqualTo: widget.comment?.reference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.commentlike != null) {
        _model.isliked = true;
        setState(() {});
      } else {
        _model.isliked = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35.0,
              height: 35.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  widget.user?.photoUrl,
                  'https://picsum.photos/seed/626/600',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 330.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.user?.displayName,
                            'n/a',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              dateTimeFormat('relative', widget.comment?.time),
                              'n/a',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Poppins'),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.comment?.comment,
                          'n/a',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleIcon(
                  onPressed: () async {
                    setState(() => _model.isliked = !_model.isliked);
                    if (_model.isliked) {
                      await _model.commentlike!.reference.delete();
                    } else {
                      await CommentlikeRecord.collection
                          .doc()
                          .set(createCommentlikeRecordData(
                            comment: widget.comment?.reference,
                            user: currentUserReference,
                            time: getCurrentTimestamp,
                          ));
                    }
                  },
                  value: _model.isliked,
                  onIcon: Icon(
                    Icons.favorite_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                  offIcon: Icon(
                    Icons.favorite_border,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                ),
                FutureBuilder<int>(
                  future: queryCommentlikeRecordCount(
                    queryBuilder: (commentlikeRecord) =>
                        commentlikeRecord.where(
                      'comment',
                      isEqualTo: widget.comment?.reference,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitWanderingCubes(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    int textCount = snapshot.data!;
                    return Text(
                      '234',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
