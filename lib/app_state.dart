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
    adnScan.add(value);
  }

  void removeFromAdnScan(String value) {
    adnScan.remove(value);
  }

  void removeAtIndexFromAdnScan(int index) {
    adnScan.removeAt(index);
  }

  void updateAdnScanAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adnScan[index] = updateFn(_adnScan[index]);
  }

  void insertAtIndexInAdnScan(int index, String value) {
    adnScan.insert(index, value);
  }

  Color _couleur = Colors.transparent;
  Color get couleur => _couleur;
  set couleur(Color value) {
    _couleur = value;
  }

  List<String> _mdpfinale = [];
  List<String> get mdpfinale => _mdpfinale;
  set mdpfinale(List<String> value) {
    _mdpfinale = value;
  }

  void addToMdpfinale(String value) {
    mdpfinale.add(value);
  }

  void removeFromMdpfinale(String value) {
    mdpfinale.remove(value);
  }

  void removeAtIndexFromMdpfinale(int index) {
    mdpfinale.removeAt(index);
  }

  void updateMdpfinaleAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    mdpfinale[index] = updateFn(_mdpfinale[index]);
  }

  void insertAtIndexInMdpfinale(int index, String value) {
    mdpfinale.insert(index, value);
  }

  bool _continuer = false;
  bool get continuer => _continuer;
  set continuer(bool value) {
    _continuer = value;
  }

  List<String> _MessNot = [
    'N\'oubliez pas votre mission de résoudre les 5 énigmes pour trouver le code final. Faites attention et restez vigilant.',
    'N\'oubliez pas de chercher les traces d\'ADN cachées dans le musée et les scanner. Faites attention et restez vigilant.',
    'Voici votre outil pour l\'aventure : le DECRYPTEK. Utilisez-le pour résoudre différentes énigmes dans le musée.',
    'Voici votre outil pour l\'aventure : le Scanner X-2000. Utilisez-le pour détecter et analyser les traces d\'animaux cachées dans le musée.',
    'Il ne vous reste plus que 1 énigme à résoudre sur les 5. Continuez, vous êtes presque au bout !',
    'Il ne vous reste plus que 2 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
    'Il ne vous reste plus que 3 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
    'Il ne vous reste plus que 4 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
    'Félicitations ! Vous avez résolu toutes les énigmes. Maintenant, insérez le code final pour envoyer les données trouvées.'
  ];
  List<String> get MessNot => _MessNot;
  set MessNot(List<String> value) {
    _MessNot = value;
  }

  void addToMessNot(String value) {
    MessNot.add(value);
  }

  void removeFromMessNot(String value) {
    MessNot.remove(value);
  }

  void removeAtIndexFromMessNot(int index) {
    MessNot.removeAt(index);
  }

  void updateMessNotAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MessNot[index] = updateFn(_MessNot[index]);
  }

  void insertAtIndexInMessNot(int index, String value) {
    MessNot.insert(index, value);
  }

  int _NbrEnigmesFait = 0;
  int get NbrEnigmesFait => _NbrEnigmesFait;
  set NbrEnigmesFait(int value) {
    _NbrEnigmesFait = value;
  }

  List<String> _nbrmdp = [
    'mdp1',
    'mdp2',
    'mdp3',
    'mdp4',
    'mdp5',
    'mdp6',
    'mdp7',
    'mdp8',
    'mdp9',
    'mdp10'
  ];
  List<String> get nbrmdp => _nbrmdp;
  set nbrmdp(List<String> value) {
    _nbrmdp = value;
  }

  void addToNbrmdp(String value) {
    nbrmdp.add(value);
  }

  void removeFromNbrmdp(String value) {
    nbrmdp.remove(value);
  }

  void removeAtIndexFromNbrmdp(int index) {
    nbrmdp.removeAt(index);
  }

  void updateNbrmdpAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nbrmdp[index] = updateFn(_nbrmdp[index]);
  }

  void insertAtIndexInNbrmdp(int index, String value) {
    nbrmdp.insert(index, value);
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
