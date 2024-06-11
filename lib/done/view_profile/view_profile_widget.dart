import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/lapabackendcurt/booking_history/booking_history_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_profile_model.dart';
export 'view_profile_model.dart';

class ViewProfileWidget extends StatefulWidget {
  const ViewProfileWidget({super.key});

  @override
  State<ViewProfileWidget> createState() => _ViewProfileWidgetState();
}

class _ViewProfileWidgetState extends State<ViewProfileWidget>
    with TickerProviderStateMixin {
  late ViewProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final selectedMedia = await selectMediaWithSourceBottomSheet(
              context: context,
              allowPhoto: true,
              allowVideo: true,
            );
            if (selectedMedia != null &&
                selectedMedia
                    .every((m) => validateFileFormat(m.storagePath, context))) {
              setState(() => _model.isDataUploading2 = true);
              var selectedUploadedFiles = <FFUploadedFile>[];

              var downloadUrls = <String>[];
              try {
                selectedUploadedFiles = selectedMedia
                    .map((m) => FFUploadedFile(
                          name: m.storagePath.split('/').last,
                          bytes: m.bytes,
                          height: m.dimensions?.height,
                          width: m.dimensions?.width,
                          blurHash: m.blurHash,
                        ))
                    .toList();

                downloadUrls = (await Future.wait(
                  selectedMedia.map(
                    (m) async => await uploadData(m.storagePath, m.bytes),
                  ),
                ))
                    .where((u) => u != null)
                    .map((u) => u!)
                    .toList();
              } finally {
                _model.isDataUploading2 = false;
              }
              if (selectedUploadedFiles.length == selectedMedia.length &&
                  downloadUrls.length == selectedMedia.length) {
                setState(() {
                  _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                  _model.uploadedFileUrl2 = downloadUrls.first;
                });
              } else {
                setState(() {});
                return;
              }
            }

            await currentUserReference!.update({
              ...mapToFirestore(
                {
                  'portfolio': FieldValue.arrayUnion([_model.uploadedFileUrl2]),
                },
              ),
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading1 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading1 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile1 =
                                    selectedUploadedFiles.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: Image.network(
                            valueOrDefault(currentUserDocument?.coverPhoto,
                                            '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.coverPhoto,
                                            '') !=
                                        ''
                                ? valueOrDefault(
                                    currentUserDocument?.coverPhoto, '')
                                : 'https://picsum.photos/seed/114/600',
                            width: double.infinity,
                            height: 137.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(5.04, 1.81),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 65.0, 0.0, 0.0),
                              child: Container(
                                width: 95.0,
                                height: 95.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.87, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 70.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 85.0,
                                  height: 85.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://images.unsplash.com/photo-1455274111113-575d080ce8cd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8cHJvZmlsZXxlbnwwfHx8fDE3MDIyMTQxNDZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                55.0, 130.0, 0.0, 0.0),
                            child: Icon(
                              Icons.edit_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 20.0, 27.0),
                        child: Icon(
                          Icons.mode_edit,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 8.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Settings');
                          },
                          child: Icon(
                            Icons.menu_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 20.0,
                        decoration: BoxDecoration(),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            '${valueOrDefault(currentUserDocument?.fname, '')} ${valueOrDefault(currentUserDocument?.lname, '')}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20.0,
                        decoration: BoxDecoration(),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.bio, ''),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).info,
                              icon: Icon(
                                Icons.facebook_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await launchURL(valueOrDefault(
                                    currentUserDocument?.fb, ''));
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).info,
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await launchURL(valueOrDefault(
                                    currentUserDocument?.yt, ''));
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).info,
                              icon: FaIcon(
                                FontAwesomeIcons.instagramSquare,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await launchURL(valueOrDefault(
                                    currentUserDocument?.yt, ''));
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                150.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                              icon: Icon(
                                Icons.calendar_month,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('calendar');
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<int>(
                                  future: queryPostsRecordCount(
                                    queryBuilder: (postsRecord) =>
                                        postsRecord.where(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    int textCount = snapshot.data!;
                                    return Text(
                                      textCount.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    );
                                  },
                                ),
                                Text(
                                  'Posts',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '0',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                Text(
                                  'Followers',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '1',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                Text(
                                  'Following',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).secondary,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: 'Portfolio',
                            ),
                            Tab(
                              text: 'Booking History',
                            ),
                            Tab(
                              text: 'Rates',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final portfolio = (currentUserDocument
                                                ?.portfolio
                                                ?.toList() ??
                                            [])
                                        .toList();
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: portfolio.length,
                                      itemBuilder: (context, portfolioIndex) {
                                        final portfolioItem =
                                            portfolio[portfolioIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onLongPress: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Delete Photo from portfolio'),
                                                          content: Text(
                                                              'Are you sure?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'portfolio':
                                                        FieldValue.arrayRemove(
                                                            [portfolioItem]),
                                                  },
                                                ),
                                              });
                                              await FirebaseStorage.instance
                                                  .refFromURL(portfolioItem)
                                                  .delete();
                                            }
                                          },
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              portfolioItem,
                                              'https://picsum.photos/seed/180/600',
                                            ),
                                            width: 500.0,
                                            height: 500.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            StreamBuilder<List<ApplicationsRecord>>(
                              stream: queryApplicationsRecord(
                                queryBuilder: (applicationsRecord) =>
                                    applicationsRecord.where(
                                  'performer',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ApplicationsRecord>
                                    containerApplicationsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${containerApplicationsRecordList.length.toString()} bookings',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final books =
                                              containerApplicationsRecordList
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: books.length,
                                            itemBuilder: (context, booksIndex) {
                                              final booksItem =
                                                  books[booksIndex];
                                              return BookingHistoryWidget(
                                                key: Key(
                                                    'Keym2e_${booksIndex}_of_${books.length}'),
                                                job: booksItem.jobID!,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<ReviewsRecord>>(
                              stream: queryReviewsRecord(
                                queryBuilder: (reviewsRecord) =>
                                    reviewsRecord.where(
                                  'reviewed',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ReviewsRecord> columnReviewsRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnReviewsRecordList.length,
                                      (columnIndex) {
                                    final columnReviewsRecord =
                                        columnReviewsRecordList[columnIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Opacity(
                                          opacity: 0.5,
                                          child: Divider(
                                            thickness: 0.5,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 15.0, 18.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                columnReviewsRecord.reviewer!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        SpinKitWanderingCubes(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final rowUsersRecord =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        rowUsersRecord.photoUrl,
                                                        'https://picsum.photos/seed/273/600',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            rowUsersRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        RatingBarIndicator(
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          rating:
                                                              valueOrDefault<
                                                                  double>(
                                                            columnReviewsRecord
                                                                .rate1,
                                                            0.0,
                                                          ),
                                                          unratedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                          itemCount: 5,
                                                          itemSize: 20.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    70.0, 10.0, 0.0, 15.0),
                                            child: Text(
                                              columnReviewsRecord.feedback,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.5,
                                          child: Divider(
                                            thickness: 0.5,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}
