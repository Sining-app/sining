import '/auth/firebase_auth/auth_util.dart';
import '/components/b_l_component/b_l_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'block_list_model.dart';
export 'block_list_model.dart';

class BlockListWidget extends StatefulWidget {
  const BlockListWidget({super.key});

  @override
  State<BlockListWidget> createState() => _BlockListWidgetState();
}

class _BlockListWidgetState extends State<BlockListWidget> {
  late BlockListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockListModel());
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
          child: Align(
            alignment: AlignmentDirectional(-1.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 70.0, 30.0, 0.0),
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
                          Icons.arrow_back_outlined,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Text(
                          'Block list',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                      Container(
                        width: 35.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  indent: 30.0,
                  endIndent: 30.0,
                  color: Color(0x8C919292),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          final blocklist =
                              (currentUserDocument?.userBlocked?.toList() ?? [])
                                  .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: blocklist.length,
                            itemBuilder: (context, blocklistIndex) {
                              final blocklistItem = blocklist[blocklistIndex];
                              return BLComponentWidget(
                                key: Key(
                                    'Keyxzf_${blocklistIndex}_of_${blocklist.length}'),
                                blocked: blocklistItem,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
