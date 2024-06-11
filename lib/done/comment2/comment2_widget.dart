import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment2_model.dart';
export 'comment2_model.dart';

class Comment2Widget extends StatefulWidget {
  const Comment2Widget({super.key});

  @override
  State<Comment2Widget> createState() => _Comment2WidgetState();
}

class _Comment2WidgetState extends State<Comment2Widget> {
  late Comment2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Comment2Model());
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
        padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 20.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 33.0,
              height: 33.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1608319917470-9d9179430f8d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxzaW5nZXJ8ZW58MHx8fHwxNzAxODI3OTIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
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
                          'Angel Siaboc',
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
                            '9h',
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
                        'hello from the other side you belong with me speack now bunch of words i cannot comprehend i hate math thank you chupchup mwamwa.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          'Reply',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 8.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
