import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_reminder_model.dart';
export 'payment_reminder_model.dart';

class PaymentReminderWidget extends StatefulWidget {
  const PaymentReminderWidget({
    super.key,
    required this.chat,
  });

  final DocumentReference? chat;

  @override
  State<PaymentReminderWidget> createState() => _PaymentReminderWidgetState();
}

class _PaymentReminderWidgetState extends State<PaymentReminderWidget> {
  late PaymentReminderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentReminderModel());
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
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 318.0,
                      height: 329.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Stack(
                        children: [
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
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.6),
                    child: Container(
                      width: 236.0,
                      height: 160.0,
                      decoration: BoxDecoration(),
                      child: Lottie.asset(
                        'assets/lottie_animations/ociU0Dz6lj.json',
                        width: 390.0,
                        height: 130.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.07, 0.36),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                      child: Text(
                        'Time to pay your performer. \nMessage and arrange payment.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).accent1,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.14, -0.7),
                    child: Text(
                      'Payment Reminder',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
