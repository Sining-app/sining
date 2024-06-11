import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'anime_hired_model.dart';
export 'anime_hired_model.dart';

class AnimeHiredWidget extends StatefulWidget {
  const AnimeHiredWidget({
    super.key,
    required this.chat,
  });

  final DocumentReference? chat;

  @override
  State<AnimeHiredWidget> createState() => _AnimeHiredWidgetState();
}

class _AnimeHiredWidgetState extends State<AnimeHiredWidget> {
  late AnimeHiredModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimeHiredModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 300.0,
            height: 400.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 318.0,
                    height: 272.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.06, 0.44),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              'Applicant Hired!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -5.51),
                          child: Container(
                            width: 300.0,
                            height: 259.0,
                            decoration: BoxDecoration(),
                            child: Lottie.asset(
                              'assets/lottie_animations/6ghYV7D6L0.json',
                              width: 150.0,
                              height: 130.0,
                              fit: BoxFit.fitHeight,
                              animate: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.05, 0.86),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 18.0,
                            ),
                            onPressed: () async {
                              _model.user = await UsersRecord.getDocumentOnce(
                                  widget.chat!);

                              context.pushNamed(
                                'ChatPage',
                                queryParameters: {
                                  'chatUser': serializeParam(
                                    _model.user,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': _model.user,
                                },
                              );

                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
