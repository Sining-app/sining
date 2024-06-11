import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/done/pages1/navbar/navbar_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'All Chats',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: Colors.black,
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('StartConvo');
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where(
                        'users',
                        arrayContains: currentUserReference,
                      )
                      .orderBy('last_message_time', descending: true),
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
                  List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewChatsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewChatsRecord =
                          listViewChatsRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: StreamBuilder<List<ApplicationsRecord>>(
                          stream: queryApplicationsRecord(
                            queryBuilder: (applicationsRecord) =>
                                applicationsRecord
                                    .where(
                                      'organizer',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'performer',
                                      isEqualTo: listViewChatsRecord.userA ==
                                              currentUserReference
                                          ? listViewChatsRecord.userB
                                          : listViewChatsRecord.userA,
                                    )
                                    .where(
                                      'isHired',
                                      isEqualTo: true,
                                    ),
                            singleRecord: true,
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
                            List<ApplicationsRecord>
                                chatPreviewApplicationsRecordList =
                                snapshot.data!;
                            final chatPreviewApplicationsRecord =
                                chatPreviewApplicationsRecordList.isNotEmpty
                                    ? chatPreviewApplicationsRecordList.first
                                    : null;
                            return StreamBuilder<FFChatInfo>(
                              stream: FFChatManager.instance
                                  .getChatInfo(chatRecord: listViewChatsRecord),
                              builder: (context, snapshot) {
                                final chatInfo = snapshot.data ??
                                    FFChatInfo(listViewChatsRecord);
                                return FFChatPreview(
                                  onTap: () => context.pushNamed(
                                    'ChatPage',
                                    queryParameters: {
                                      'chatUser': serializeParam(
                                        chatInfo.otherUsers.length == 1
                                            ? chatInfo.otherUsersList.first
                                            : null,
                                        ParamType.Document,
                                      ),
                                      'chatRef': serializeParam(
                                        chatInfo.chatRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser':
                                          chatInfo.otherUsers.length == 1
                                              ? chatInfo.otherUsersList.first
                                              : null,
                                    },
                                  ),
                                  lastChatText: chatInfo.chatPreviewMessage(),
                                  lastChatTime:
                                      listViewChatsRecord.lastMessageTime,
                                  seen: listViewChatsRecord.lastMessageSeenBy!
                                      .contains(currentUserReference),
                                  title: chatInfo.chatPreviewTitle(),
                                  userProfilePic: chatInfo.chatPreviewPic(),
                                  color: valueOrDefault<Color>(
                                    chatPreviewApplicationsRecord != null
                                        ? Color(0x90FFF0B7)
                                        : Color(0x00000000),
                                    Color(0x90FFF0B7),
                                  ),
                                  unreadColor: Colors.blue,
                                  titleTextStyle: GoogleFonts.getFont(
                                    'DM Sans',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  dateTextStyle: GoogleFonts.getFont(
                                    'DM Sans',
                                    color: Color(0x73000000),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  previewTextStyle: GoogleFonts.getFont(
                                    'DM Sans',
                                    color: Color(0x73000000),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  contentPadding: EdgeInsets.all(3.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            wrapWithModel(
              model: _model.navbarModel,
              updateCallback: () => setState(() {}),
              child: NavbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
