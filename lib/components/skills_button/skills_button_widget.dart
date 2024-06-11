import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills_button_model.dart';
export 'skills_button_model.dart';

class SkillsButtonWidget extends StatefulWidget {
  const SkillsButtonWidget({super.key});

  @override
  State<SkillsButtonWidget> createState() => _SkillsButtonWidgetState();
}

class _SkillsButtonWidgetState extends State<SkillsButtonWidget> {
  late SkillsButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillsButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 118.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dancer',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
