import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_likes_model.dart';
export 'filter_likes_model.dart';

class FilterLikesWidget extends StatefulWidget {
  const FilterLikesWidget({
    super.key,
    required this.poster,
    required this.fname,
    required this.lname,
    required this.username,
  });

  final DocumentReference? poster;
  final String? fname;
  final String? lname;
  final String? username;

  @override
  State<FilterLikesWidget> createState() => _FilterLikesWidgetState();
}

class _FilterLikesWidgetState extends State<FilterLikesWidget> {
  late FilterLikesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterLikesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: 390.0,
        height: 210.0,
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
            Text(
              'Sort by',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: Color(0x85919292),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: Container(
                width: 390.0,
                height: 95.0,
                decoration: BoxDecoration(
                  color: Color(0x4D919292),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 15.0, 15.0),
                  child: FlutterFlowRadioButton(
                    options: ['Newest to oldest', 'Oldest to newest'].toList(),
                    onChanged: (val) => setState(() {}),
                    controller: _model.radioButtonValueController ??=
                        FormFieldController<String>('Newest to oldest'),
                    optionHeight: 30.0,
                    textStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                    textPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 125.0, 0.0),
                    buttonPosition: RadioButtonPosition.right,
                    direction: Axis.vertical,
                    radioButtonColor: FlutterFlowTheme.of(context).primary,
                    inactiveRadioButtonColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
