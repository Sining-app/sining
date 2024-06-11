import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 50.0, 0.0, 0.0),
      child: Container(
        width: 164.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  FFAppState().Filter = '';
                  _model.updatePage(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.all_inclusive_sharp,
                        color: Color(0xFFFAFCFD),
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'All',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFFAFCFD),
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  FFAppState().Filter = 'Job';
                  _model.updatePage(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.work,
                        color: Color(0xFFFAFCFD),
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Jobs',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFFAFCFD),
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  FFAppState().Filter = 'Forum';
                  _model.updatePage(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.forum,
                        color: Color(0xFFFAFCFD),
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Forum',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFFAFCFD),
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 15.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  FFAppState().Filter = 'Event';
                  _model.updatePage(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.event,
                        color: Color(0xFFFAFCFD),
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Events',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFFAFCFD),
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
