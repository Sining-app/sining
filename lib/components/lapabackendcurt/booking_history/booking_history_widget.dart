import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_history_model.dart';
export 'booking_history_model.dart';

class BookingHistoryWidget extends StatefulWidget {
  const BookingHistoryWidget({
    super.key,
    required this.job,
  });

  final DocumentReference? job;

  @override
  State<BookingHistoryWidget> createState() => _BookingHistoryWidgetState();
}

class _BookingHistoryWidgetState extends State<BookingHistoryWidget> {
  late BookingHistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingHistoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: StreamBuilder<PostsRecord>(
        stream: PostsRecord.getDocument(widget.job!),
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
          final containerPostsRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxFVkVOVHxlbnwwfHx8fDE3MDE3ODAxNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 55.0,
                                height: 55.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  containerPostsRecord.title,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final jobs =
                                        containerPostsRecord.talents.toList();
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(jobs.length,
                                          (jobsIndex) {
                                        final jobsItem = jobs[jobsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            jobsItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            containerPostsRecord.addressName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                      Text(
                        dateTimeFormat(
                            'relative', containerPostsRecord.eventdate!),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).accent1,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Poppins'),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
