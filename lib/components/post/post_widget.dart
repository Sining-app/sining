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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.content,
    this.images,
    required this.poster,
    required this.time,
    required this.id,
    required this.title,
    required this.type,
    required this.talents,
    bool? isActive,
    required this.location,
  }) : this.isActive = isActive ?? true;

  final String? content;
  final List<String>? images;
  final DocumentReference? poster;
  final DateTime? time;
  final DocumentReference? id;
  final String? title;
  final String? type;
  final List<String>? talents;
  final bool isActive;
  final String? location;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.poster!),
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
        final socialPost1UsersRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: FutureBuilder<int>(
              future: queryRepliesRecordCount(
                queryBuilder: (repliesRecord) => repliesRecord.where(
                  'post',
                  isEqualTo: widget.id,
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
                int columnCount = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'PostExpansion',
                            queryParameters: {
                              'post': serializeParam(
                                widget.id,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (socialPost1UsersRecord.type ==
                                        'Performer') {
                                      context.pushNamed(
                                        'otherprofile',
                                        queryParameters: {
                                          'performer': serializeParam(
                                            socialPost1UsersRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        'otherprofile',
                                        queryParameters: {
                                          'organizer': serializeParam(
                                            socialPost1UsersRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        socialPost1UsersRecord.photoUrl,
                                        'https://jzgenddakcmrkyritewj.supabase.co/storage/v1/object/public/sining_medias/ProfilePics/default.png',
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        socialPost1UsersRecord.displayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Poppins'),
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'relative', widget.time),
                                              'n/a',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          if (widget.location != null &&
                                              widget.location != '')
                                            Opacity(
                                              opacity: 0.7,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '• ${widget.location}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (socialPost1UsersRecord.displayName ==
                                      currentUserDisplayName) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: POTheUserWidget(
                                            postdel: widget.id!,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: POOtherUserWidget(
                                            poster: widget.poster!,
                                            fname: socialPost1UsersRecord.fname,
                                            lname: socialPost1UsersRecord.lname,
                                            username: socialPost1UsersRecord
                                                .displayName,
                                            postref: widget.id!,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Icon(
                                  Icons.keyboard_control,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.images?.length != 0)
                      Builder(
                        builder: (context) {
                          final image = widget.images?.toList() ?? [];
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(image.length, (imageIndex) {
                                final imageItem = image[imageIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            imageItem,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: imageItem,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: imageItem,
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      imageItem,
                                      width: MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context).width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<LikeRecord>>(
                                stream: queryLikeRecord(
                                  queryBuilder: (likeRecord) => likeRecord
                                      .where(
                                        'post',
                                        isEqualTo: widget.id,
                                      )
                                      .where(
                                        'user',
                                        isEqualTo: currentUserReference,
                                      ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitWanderingCubes(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LikeRecord> rowLikeRecordList =
                                      snapshot.data!;
                                  final rowLikeRecord =
                                      rowLikeRecordList.isNotEmpty
                                          ? rowLikeRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!(rowLikeRecord != null))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 2.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 30.0,
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await LikeRecord.collection
                                                  .doc()
                                                  .set(createLikeRecordData(
                                                    post: widget.id,
                                                    user: currentUserReference,
                                                    time: getCurrentTimestamp,
                                                  ));

                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createNotificationsRecordData(
                                                    notificationBody:
                                                        ' liked your post.',
                                                    user: widget.poster,
                                                    post: widget.id,
                                                    time: getCurrentTimestamp,
                                                    title: '',
                                                    sender:
                                                        currentUserReference,
                                                  ));
                                            },
                                          ),
                                        ),
                                      if (rowLikeRecord != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 2.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 30.0,
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Color(0xFFC73C3C),
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await rowLikeRecord!.reference
                                                  .delete();
                                            },
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    icon: Icon(
                                      Icons.mode_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 22.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CommentBSWidget(
                                              post: widget.id!,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ],
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                icon: Icon(
                                  Icons.share_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                    'PostExpansion',
                                    queryParameters: {
                                      'post': serializeParam(
                                        widget.id,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((widget.type == 'Job') && widget.isActive)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: !widget.isActive
                                        ? null
                                        : () async {
                                            context.pushNamed(
                                              'ApplicationPage',
                                              queryParameters: {
                                                'post': serializeParam(
                                                  widget.id,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                    text: widget.isActive ? 'Apply' : 'Closed',
                                    options: FFButtonOptions(
                                      height: 24.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(14.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      disabledTextColor: Color(0xFFA30D0D),
                                    ),
                                  ),
                                ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                icon: Icon(
                                  Icons.bookmark,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<int>(
                      future: queryLikeRecordCount(
                        queryBuilder: (likeRecord) => likeRecord.where(
                          'post',
                          isEqualTo: widget.id,
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
                        int rowCount = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 5.0),
                              child: FutureBuilder<int>(
                                future: queryCommentRecordCount(
                                  queryBuilder: (commentRecord) =>
                                      commentRecord.where(
                                    'post',
                                    isEqualTo: widget.id,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  int textCount = snapshot.data!;
                                  return Text(
                                    '${rowCount.toString()} likes, ${textCount.toString()} comments',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFF7A868F),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    if (widget.title != 'n/a')
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.title,
                              'n/a',
                            ).maybeHandleOverflow(
                              maxChars: 70,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    if (widget.talents!.length > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final talents = widget.talents!.toList();
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(talents.length, (talentsIndex) {
                                final talentsItem = talents[talentsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    '${talentsItem}${talentsIndex == (widget.talents!.length - 1) ? '' : ','}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.content,
                            'null',
                          ).maybeHandleOverflow(
                            maxChars: 70,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
