import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/anime_hired/anime_hired_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_application_model.dart';
export 'view_application_model.dart';

class ViewApplicationWidget extends StatefulWidget {
  const ViewApplicationWidget({
    super.key,
    required this.applicant,
  });

  final DocumentReference? applicant;

  @override
  State<ViewApplicationWidget> createState() => _ViewApplicationWidgetState();
}

class _ViewApplicationWidgetState extends State<ViewApplicationWidget> {
  late ViewApplicationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewApplicationModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApplicationsRecord>(
      stream: ApplicationsRecord.getDocument(widget.applicant!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final viewApplicationApplicationsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(
                    viewApplicationApplicationsRecord.performer!),
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
                  final stackUsersRecord = snapshot.data!;
                  return Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'otherprofile',
                                          queryParameters: {
                                            'performer': serializeParam(
                                              viewApplicationApplicationsRecord
                                                  .performer,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10.0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          width: 150.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF9C833),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 70.0,
                                                height: 70.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  currentUserPhoto,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                '${stackUsersRecord.fname} ${valueOrDefault(currentUserDocument?.lname, '')}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF1A1919),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 15.0),
                                            child: Text(
                                              '@${stackUsersRecord.displayName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            Color(0xFF1A1919),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      indent: 20.0,
                                      endIndent: 20.0,
                                      color: Color(0x7C919292),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Cover Letter',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            viewApplicationApplicationsRecord
                                                .letter,
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Resume',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
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
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowPdfViewer(
                                        networkPath:
                                            viewApplicationApplicationsRecord
                                                .resume,
                                        width: 400.0,
                                        height: 550.0,
                                        horizontalScroll: false,
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Color(0xFF0F0E0E),
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.99),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              elevation: 10.0,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.applicant!
                                        .update(createApplicationsRecordData(
                                      isHired: false,
                                      resume: 'rejected',
                                    ));
                                    triggerPushNotification(
                                      notificationTitle: 'You got rejected',
                                      notificationText:
                                          '${currentUserDisplayName} rejected your application',
                                      userRefs: [
                                        viewApplicationApplicationsRecord
                                            .performer!
                                      ],
                                      initialPageName: 'YourApplications',
                                      parameterData: {},
                                    );

                                    await NotificationsRecord.collection
                                        .doc()
                                        .set(createNotificationsRecordData(
                                          user:
                                              viewApplicationApplicationsRecord
                                                  .performer,
                                          sender: currentUserReference,
                                          post:
                                              viewApplicationApplicationsRecord
                                                  .jobID,
                                          time: getCurrentTimestamp,
                                          notificationBody:
                                              '${currentUserDisplayName} rejected your application',
                                          title: 'You got rejected',
                                        ));
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 20.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 10.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 65.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Hired applicant'),
                                                      content: Text('R U SURE'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await widget.applicant!.update(
                                              createApplicationsRecordData(
                                            isHired: true,
                                            status: 'currently hired',
                                          ));
                                          triggerPushNotification(
                                            notificationTitle: 'You are Hired!',
                                            notificationText:
                                                '${currentUserDisplayName}accepted your application!(${viewApplicationApplicationsRecord.jobname})',
                                            userRefs: [
                                              stackUsersRecord.reference
                                            ],
                                            initialPageName: 'YourApplications',
                                            parameterData: {},
                                          );
                                        }
                                        context.safePop();
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: AnimeHiredWidget(
                                                  chat:
                                                      viewApplicationApplicationsRecord
                                                          .performer!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              elevation: 10.0,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ChatPage',
                                      queryParameters: {
                                        'chatUser': serializeParam(
                                          stackUsersRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'chatUser': stackUsersRecord,
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.chat_bubble,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
