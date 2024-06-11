import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _searchtype = prefs.getString('ff_searchtype') ?? _searchtype;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _skills = [];
  List<String> get skills => _skills;
  set skills(List<String> _value) {
    _skills = _value;
  }

  void addToSkills(String _value) {
    _skills.add(_value);
  }

  void removeFromSkills(String _value) {
    _skills.remove(_value);
  }

  void removeAtIndexFromSkills(int _index) {
    _skills.removeAt(_index);
  }

  void updateSkillsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _skills[_index] = updateFn(_skills[_index]);
  }

  void insertAtIndexInSkills(int _index, String _value) {
    _skills.insert(_index, _value);
  }

  List<String> _PostImages = [];
  List<String> get PostImages => _PostImages;
  set PostImages(List<String> _value) {
    _PostImages = _value;
  }

  void addToPostImages(String _value) {
    _PostImages.add(_value);
  }

  void removeFromPostImages(String _value) {
    _PostImages.remove(_value);
  }

  void removeAtIndexFromPostImages(int _index) {
    _PostImages.removeAt(_index);
  }

  void updatePostImagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _PostImages[_index] = updateFn(_PostImages[_index]);
  }

  void insertAtIndexInPostImages(int _index, String _value) {
    _PostImages.insert(_index, _value);
  }

  String _searchtype = 'Jobs';
  String get searchtype => _searchtype;
  set searchtype(String _value) {
    _searchtype = _value;
    prefs.setString('ff_searchtype', _value);
  }

  List<dynamic> _events = [];
  List<dynamic> get events => _events;
  set events(List<dynamic> _value) {
    _events = _value;
  }

  void addToEvents(dynamic _value) {
    _events.add(_value);
  }

  void removeFromEvents(dynamic _value) {
    _events.remove(_value);
  }

  void removeAtIndexFromEvents(int _index) {
    _events.removeAt(_index);
  }

  void updateEventsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _events[_index] = updateFn(_events[_index]);
  }

  void insertAtIndexInEvents(int _index, dynamic _value) {
    _events.insert(_index, _value);
  }

  String _Filter = '';
  String get Filter => _Filter;
  set Filter(String _value) {
    _Filter = _value;
  }

  LatLng? _setLatLng;
  LatLng? get setLatLng => _setLatLng;
  set setLatLng(LatLng? _value) {
    _setLatLng = _value;
  }

  String _setAddress = '';
  String get setAddress => _setAddress;
  set setAddress(String _value) {
    _setAddress = _value;
  }

  String _setAddressName = '';
  String get setAddressName => _setAddressName;
  set setAddressName(String _value) {
    _setAddressName = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
