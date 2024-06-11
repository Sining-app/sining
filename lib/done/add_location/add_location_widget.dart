import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_location_model.dart';
export 'add_location_model.dart';

class AddLocationWidget extends StatefulWidget {
  const AddLocationWidget({super.key});

  @override
  State<AddLocationWidget> createState() => _AddLocationWidgetState();
}

class _AddLocationWidgetState extends State<AddLocationWidget> {
  late AddLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddLocationModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitWanderingCubes(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 430.0,
                    height: 57.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    110.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Add Location',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 18.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.check,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                            onPressed: (_model.placePickerValue.address == '')
                                ? null
                                : () async {
                                    FFAppState().setLatLng =
                                        _model.placePickerValue.latLng;
                                    FFAppState().setAddress =
                                        _model.placePickerValue.address;
                                    FFAppState().setAddressName =
                                        _model.placePickerValue.name;
                                    context.safePop();
                                  },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 900.0,
                    decoration: BoxDecoration(),
                    child: Builder(builder: (context) {
                      final _googleMapMarker = _model.placePickerValue.latLng;
                      return FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserLocationValue!,
                        markers: [
                          if (_googleMapMarker != null)
                            FlutterFlowMarker(
                              _googleMapMarker.serialize(),
                              _googleMapMarker,
                            ),
                        ],
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 16.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      );
                    }),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 600.0, 0.0, 0.0),
                      child: FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyCzaZXedfgVJpfYyUpICNnJRq79CIQp0uc',
                        androidGoogleMapsApiKey:
                            'AIzaSyBG1_dm2jBvspB3c40xRjBBPPkt8ewki2g',
                        webGoogleMapsApiKey:
                            'AIzaSyBb3RjMKOcYCDLo1H_YKaqv-O2Y_kzSwHs',
                        onSelect: (place) async {
                          setState(() => _model.placePickerValue = place);
                          (await _model.googleMapsController.future)
                              .animateCamera(CameraUpdate.newLatLng(
                                  place.latLng.toGoogleMaps()));
                        },
                        defaultText: 'Select Location',
                        icon: Icon(
                          Icons.place,
                          color: FlutterFlowTheme.of(context).info,
                          size: 16.0,
                        ),
                        buttonOptions: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
