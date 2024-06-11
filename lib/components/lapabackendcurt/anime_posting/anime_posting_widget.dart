import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'anime_posting_model.dart';
export 'anime_posting_model.dart';

class AnimePostingWidget extends StatefulWidget {
  const AnimePostingWidget({super.key});

  @override
  State<AnimePostingWidget> createState() => _AnimePostingWidgetState();
}

class _AnimePostingWidgetState extends State<AnimePostingWidget> {
  late AnimePostingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimePostingModel());
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
        Container(
          width: 300.0,
          height: 400.0,
          decoration: BoxDecoration(),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.39),
                child: Container(
                  width: 250.0,
                  height: 237.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.07, 0.76),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Text(
                            'posting...',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.15),
                        child: Container(
                          width: 300.0,
                          height: 190.0,
                          decoration: BoxDecoration(),
                          child: Lottie.asset(
                            'assets/lottie_animations/Animation_-_1702360623056.json',
                            width: 150.0,
                            height: 187.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
