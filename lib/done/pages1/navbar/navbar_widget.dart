import '/auth/firebase_auth/auth_util.dart';
import '/done/choice/choice_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? page,
  }) : this.page = page ?? 0;

  final int page;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, -0.2),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.home,
                    color: valueOrDefault<Color>(
                      widget.page == 1
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9299A1),
                      Color(0xFF9299A1),
                    ),
                    size: 16.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Dashboard');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.checklist_rtl,
                    color: valueOrDefault<Color>(
                      widget.page == 2
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9299A1),
                      Color(0xFF9299A1),
                    ),
                    size: 20.0,
                  ),
                  onPressed: () async {
                    if (valueOrDefault(currentUserDocument?.type, '') ==
                        'Performer') {
                      context.pushNamed('YourApplications');
                    } else {
                      context.pushNamed('JobLisitings');
                    }
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: valueOrDefault<Color>(
                      widget.page == 2
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9299A1),
                      Color(0xFF9299A1),
                    ),
                    size: 20.0,
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: ChoiceWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.chat_bubble,
                    color: valueOrDefault<Color>(
                      widget.page == 3
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9299A1),
                      Color(0xFF9299A1),
                    ),
                    size: 16.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Chats');
                  },
                ),
                Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                  ),
                  child: AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('ViewProfile');
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            currentUserPhoto,
                            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxwZW9wbGV8ZW58MHx8fHwxNjk2Nzg3Mjc1fDA&ixlib=rb-4.0.3&q=80&w=1080',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
