import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notif_preference_model.dart';
export 'notif_preference_model.dart';

class NotifPreferenceWidget extends StatefulWidget {
  const NotifPreferenceWidget({super.key});

  @override
  State<NotifPreferenceWidget> createState() => _NotifPreferenceWidgetState();
}

class _NotifPreferenceWidgetState extends State<NotifPreferenceWidget> {
  late NotifPreferenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifPreferenceModel());

    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchValue3 = true;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 70.0, 30.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
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
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Notification Preferences',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Poppins'),
                            ),
                      ),
                    ),
                    Container(
                      width: 35.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('EditProfile');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Push Notifications',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Switch.adaptive(
                            value: _model.switchValue1!,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue1 = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).primaryText,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                indent: 30.0,
                endIndent: 30.0,
                color: Color(0x8C919292),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('EditProfile');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Email Notifications',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Switch.adaptive(
                            value: _model.switchValue2!,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue2 = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                indent: 30.0,
                endIndent: 30.0,
                color: Color(0x8C919292),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('EditProfile');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Notification Sound',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Switch.adaptive(
                            value: _model.switchValue3!,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue3 = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
