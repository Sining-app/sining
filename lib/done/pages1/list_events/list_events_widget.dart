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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_events_model.dart';
export 'list_events_model.dart';

class ListEventsWidget extends StatefulWidget {
  const ListEventsWidget({super.key});

  @override
  State<ListEventsWidget> createState() => _ListEventsWidgetState();
}

class _ListEventsWidgetState extends State<ListEventsWidget> {
  late ListEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEventsModel());

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.keyboard_backspace,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                Text(
                  'Events',
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 296.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                      fontFamily: FlutterFlowTheme.of(context)
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
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData('ALL'),
                  ChipData('Upcoming'),
                  ChipData('Completed'),
                  ChipData('Cancelled')
                ],
                onChanged: (val) async {
                  setState(() => _model.choiceChipsValue = val?.firstOrNull);
                  if (_model.choiceChipsValue == 'All') {
                    _model.filter = '';
                    setState(() {});
                  } else {
                    _model.filter = _model.choiceChipsValue!;
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
                alignment: WrapAlignment.center,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: false,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
              child: FutureBuilder<int>(
                future: queryPostsRecordCount(
                  queryBuilder: (postsRecord) => postsRecord
                      .where(
                        'type',
                        isEqualTo: 'Job',
                      )
                      .where(
                        'poster',
                        isEqualTo: currentUserReference,
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
                  int textCount = snapshot.data!;
                  return Text(
                    '',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Poppins'),
                        ),
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: PagedListView<DocumentSnapshot<Object?>?, PostsRecord>(
              pagingController: _model.setListViewController(
                PostsRecord.collection
                    .where(
                      'type',
                      isEqualTo: 'Job',
                    )
                    .where(
                      'poster',
                      isEqualTo: currentUserReference,
                    ),
              ),
              padding: EdgeInsets.zero,
              reverse: false,
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate<PostsRecord>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitWanderingCubes(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                ),
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitWanderingCubes(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                ),

                itemBuilder: (context, _, listViewIndex) {
                  final listViewPostsRecord =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewPostsRecord.images.first,
                                              'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxFVkVOVHxlbnwwfHx8fDE3MDE3ODAxNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                            ),
                                            width: 55.0,
                                            height: 55.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewPostsRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final jobs = listViewPostsRecord
                                                    .talents
                                                    .toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      jobs.length, (jobsIndex) {
                                                    final jobsItem =
                                                        jobs[jobsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${jobsItem},',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 14.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'View Applicants',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 27.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x747E888F),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF003240),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Poppins'),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
