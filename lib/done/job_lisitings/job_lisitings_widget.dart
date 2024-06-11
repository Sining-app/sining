import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'job_lisitings_model.dart';
export 'job_lisitings_model.dart';

class JobLisitingsWidget extends StatefulWidget {
  const JobLisitingsWidget({super.key});

  @override
  State<JobLisitingsWidget> createState() => _JobLisitingsWidgetState();
}

class _JobLisitingsWidgetState extends State<JobLisitingsWidget> {
  late JobLisitingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobLisitingsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Job Listings',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Poppins'),
                          ),
                    ),
                    Container(
                      width: 37.0,
                      height: 23.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(18.0, 20.0, 18.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          Icons.filter_alt,
                          color: Color(0xEDFFF1C4),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData('ALL '),
                    ChipData('ACTIVE'),
                    ChipData('CLOSED')
                  ],
                  onChanged: (val) async {
                    setState(() => _model.choiceChipsValue = val?.firstOrNull);
                    if (_model.choiceChipsValue == 'CLOSED') {
                      _model.filter = false;
                      setState(() {});
                    } else if (_model.choiceChipsValue == 'ACTIVE') {
                      _model.filter = true;
                      setState(() {});
                    } else {
                      _model.filter = null;
                      setState(() {});
                    }
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    iconColor: Colors.white,
                    iconSize: 18.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  chipSpacing: 15.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 12.0),
                  child: Text(
                    'Jobs listings',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Poppins'),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(
                    queryBuilder: (postsRecord) => postsRecord
                        .where(
                          'poster',
                          isEqualTo: currentUserReference,
                        )
                        .where(
                          'type',
                          isEqualTo: 'Job',
                        )
                        .where(
                          'isActive',
                          isEqualTo: _model.filter,
                        ),
                  ),
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
                    List<PostsRecord> listViewPostsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPostsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPostsRecord =
                            listViewPostsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: FutureBuilder<int>(
                            future: queryApplicationsRecordCount(
                              queryBuilder: (applicationsRecord) =>
                                  applicationsRecord
                                      .where(
                                        'jobID',
                                        isEqualTo:
                                            listViewPostsRecord.reference,
                                      )
                                      .where(
                                        'organizer',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'isHired',
                                        isEqualTo: true,
                                      ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitWanderingCubes(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              int containerCount = snapshot.data!;
                              return Container(
                                width: 350.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    containerCount > 1
                                        ? Color(0xFFE9DBDB)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    Color(0xFFE9DBDB),
                                  ),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Applicants',
                                                queryParameters: {
                                                  'post': serializeParam(
                                                    listViewPostsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        listViewPostsRecord
                                                            .images.first,
                                                        'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxFVkVOVHxlbnwwfHx8fDE3MDE3ODAxNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                      ),
                                                      width: 55.0,
                                                      height: 55.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewPostsRecord
                                                              .title,
                                                          'n/',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final jobs =
                                                              listViewPostsRecord
                                                                  .talents
                                                                  .toList();
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children:
                                                                List.generate(
                                                                    jobs.length,
                                                                    (jobsIndex) {
                                                              final jobsItem =
                                                                  jobs[
                                                                      jobsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${jobsItem},',
                                                                    'mn',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.people_alt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerCount.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewPostsRecord
                                                      .addressName,
                                                  'mn',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'Md',
                                                  listViewPostsRecord
                                                      .eventdate),
                                              'n/a',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Poppins'),
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
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
