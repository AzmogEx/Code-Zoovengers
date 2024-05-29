import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _berserk = false;
  bool get berserk => _berserk;
  set berserk(bool value) {
    _berserk = value;
  }

  bool _eclair = false;
  bool get eclair => _eclair;
  set eclair(bool value) {
    _eclair = value;
  }

  bool _marsupilan = false;
  bool get marsupilan => _marsupilan;
  set marsupilan(bool value) {
    _marsupilan = value;
  }

  bool _fantome = false;
  bool get fantome => _fantome;
  set fantome(bool value) {
    _fantome = value;
  }

  bool _tasmanie = false;
  bool get tasmanie => _tasmanie;
  set tasmanie(bool value) {
    _tasmanie = value;
  }

  int _countDown = 0;
  int get countDown => _countDown;
  set countDown(int value) {
    _countDown = value;
  }
}
