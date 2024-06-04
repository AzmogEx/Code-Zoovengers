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

  int _countDown = 360000;
  int get countDown => _countDown;
  set countDown(int value) {
    _countDown = value;
  }

  bool _Difficulte = false;
  bool get Difficulte => _Difficulte;
  set Difficulte(bool value) {
    _Difficulte = value;
  }

  bool _axoloth = false;
  bool get axoloth => _axoloth;
  set axoloth(bool value) {
    _axoloth = value;
  }

  bool _simbioz = false;
  bool get simbioz => _simbioz;
  set simbioz(bool value) {
    _simbioz = value;
  }

  bool _sentinelle = false;
  bool get sentinelle => _sentinelle;
  set sentinelle(bool value) {
    _sentinelle = value;
  }

  bool _ressort = false;
  bool get ressort => _ressort;
  set ressort(bool value) {
    _ressort = value;
  }

  bool _hygrochrome = false;
  bool get hygrochrome => _hygrochrome;
  set hygrochrome(bool value) {
    _hygrochrome = value;
  }

  int _deuxheures = 720000;
  int get deuxheures => _deuxheures;
  set deuxheures(int value) {
    _deuxheures = value;
  }

  bool _animSend = false;
  bool get animSend => _animSend;
  set animSend(bool value) {
    _animSend = value;
  }

  bool _animVerif = false;
  bool get animVerif => _animVerif;
  set animVerif(bool value) {
    _animVerif = value;
  }

  List<String> _adnScan = [];
  List<String> get adnScan => _adnScan;
  set adnScan(List<String> value) {
    _adnScan = value;
  }

  void addToAdnScan(String value) {
    _adnScan.add(value);
  }

  void removeFromAdnScan(String value) {
    _adnScan.remove(value);
  }

  void removeAtIndexFromAdnScan(int index) {
    _adnScan.removeAt(index);
  }

  void updateAdnScanAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _adnScan[index] = updateFn(_adnScan[index]);
  }

  void insertAtIndexInAdnScan(int index, String value) {
    _adnScan.insert(index, value);
  }

  bool _notification = false;
  bool get notification => _notification;
  set notification(bool value) {
    _notification = value;
  }

  Color _couleur = Colors.transparent;
  Color get couleur => _couleur;
  set couleur(Color value) {
    _couleur = value;
  }

  bool _notification2 = false;
  bool get notification2 => _notification2;
  set notification2(bool value) {
    _notification2 = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
