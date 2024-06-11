import '/done/p_o_report/p_o_report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_o_other_user_model.dart';
export 'p_o_other_user_model.dart';

class POOtherUserWidget extends StatefulWidget {
  const POOtherUserWidget({
    super.key,
    required this.poster,
    required this.fname,
    required this.lname,
    required this.username,
    required this.postref,
  });

  final DocumentReference? poster;
  final String? fname;
  final String? lname;
  final String? username;
  final DocumentReference? postref;

  @override
  State<POOtherUserWidget> createState() => _POOtherUserWidgetState();
}

class _POOtherUserWidgetState extends State<POOtherUserWidget> {
  late POOtherUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => POOtherUserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.0,
      height: 170.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 30.0,
            thickness: 3.0,
            indent: 160.0,
            endIndent: 160.0,
            color: Color(0x85919292),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
            child: Container(
              width: 390.0,
              height: 115.0,
              decoration: BoxDecoration(
                color: Color(0x4D919292),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Block',
                          queryParameters: {
                            'fname': serializeParam(
                              widget.fname,
                              ParamType.String,
                            ),
                            'lname': serializeParam(
                              widget.lname,
                              ParamType.String,
                            ),
                            'username': serializeParam(
                              widget.username,
                              ParamType.String,
                            ),
                            'toBeBlocked': serializeParam(
                              widget.poster,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: 350.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 10.0),
                          child: Text(
                            'Block',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    color: Color(0xFF919292),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: POReportWidget(
                                postref: widget.postref!,
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 350.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: Text(
                            'Report',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFFFF0004),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
