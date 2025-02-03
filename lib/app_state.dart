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

  int _countDown = 3600000;
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

  List<String> _MessNotFr = [
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
  List<String> get MessNotFr => _MessNotFr;
  set MessNotFr(List<String> value) {
    _MessNotFr = value;
  }

  void addToMessNotFr(String value) {
    MessNotFr.add(value);
  }

  void removeFromMessNotFr(String value) {
    MessNotFr.remove(value);
  }

  void removeAtIndexFromMessNotFr(int index) {
    MessNotFr.removeAt(index);
  }

  void updateMessNotFrAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MessNotFr[index] = updateFn(_MessNotFr[index]);
  }

  void insertAtIndexInMessNotFr(int index, String value) {
    MessNotFr.insert(index, value);
  }

  List<String> _MessNotEn = [
    'Don\'t forget your mission to solve the 5 puzzles to find the final code. Take care and stay alert.',
    'Don\'t forget to look for DNA traces hidden in the museum and scan them. Take care and stay alert.',
    'Here is your tool for adventure: the DECRYPTEK. Use it to solve different puzzles in the museum.',
    'Here is your tool for adventure: the X-2000 Scanner. Use it to detect and analyze animal tracks hidden in the museum.',
    'You only have 1 puzzle left to solve out of the 5. Keep going, you\'re almost at the end!',
    'You only have 2 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
    'You only have 3 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
    'You only have 4 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
    'Congratulations ! You have solved all the puzzles. Now insert the final code to send the found data.'
  ];
  List<String> get MessNotEn => _MessNotEn;
  set MessNotEn(List<String> value) {
    _MessNotEn = value;
  }

  void addToMessNotEn(String value) {
    MessNotEn.add(value);
  }

  void removeFromMessNotEn(String value) {
    MessNotEn.remove(value);
  }

  void removeAtIndexFromMessNotEn(int index) {
    MessNotEn.removeAt(index);
  }

  void updateMessNotEnAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MessNotEn[index] = updateFn(_MessNotEn[index]);
  }

  void insertAtIndexInMessNotEn(int index, String value) {
    MessNotEn.insert(index, value);
  }

  List<String> _MessNotEs = [
    'No olvides tu misión de resolver los 5 acertijos para encontrar el código final. Cuídate y mantente alerta.',
    'No olvides buscar rastros de ADN escondidos en el museo y escanearlos. Cuídate y mantente alerta.',
    'Aquí está tu herramienta para la aventura: el DECRYPTEK. Úselo para resolver diferentes acertijos en el museo.',
    'Aquí está su herramienta para la aventura: el escáner X-2000. Úselo para detectar y analizar huellas de animales escondidas en el museo.',
    'Solo te queda 1 rompecabezas de los 5 por resolver. ¡Sigue adelante, ya casi llegas al final!',
    'Solo te quedan 2 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!',
    'Il ne vous reste plus que 3 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
    'Solo te quedan 4 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!',
    '¡Felicitaciones! Has resuelto todos los acertijos. Ahora inserte el código final para enviar los datos encontrados.'
  ];
  List<String> get MessNotEs => _MessNotEs;
  set MessNotEs(List<String> value) {
    _MessNotEs = value;
  }

  void addToMessNotEs(String value) {
    MessNotEs.add(value);
  }

  void removeFromMessNotEs(String value) {
    MessNotEs.remove(value);
  }

  void removeAtIndexFromMessNotEs(int index) {
    MessNotEs.removeAt(index);
  }

  void updateMessNotEsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MessNotEs[index] = updateFn(_MessNotEs[index]);
  }

  void insertAtIndexInMessNotEs(int index, String value) {
    MessNotEs.insert(index, value);
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

  String _lang = '';
  String get lang => _lang;
  set lang(String value) {
    _lang = value;
  }

  bool _guerrisseur = false;
  bool get guerrisseur => _guerrisseur;
  set guerrisseur(bool value) {
    _guerrisseur = value;
  }

  bool _chamois = false;
  bool get chamois => _chamois;
  set chamois(bool value) {
    _chamois = value;
  }

  bool _hibou = false;
  bool get hibou => _hibou;
  set hibou(bool value) {
    _hibou = value;
  }

  bool _sucre = false;
  bool get sucre => _sucre;
  set sucre(bool value) {
    _sucre = value;
  }

  bool _ornythorinque = false;
  bool get ornythorinque => _ornythorinque;
  set ornythorinque(bool value) {
    _ornythorinque = value;
  }

  bool _chauve = false;
  bool get chauve => _chauve;
  set chauve(bool value) {
    _chauve = value;
  }

  bool _paresseux = false;
  bool get paresseux => _paresseux;
  set paresseux(bool value) {
    _paresseux = value;
  }

  bool _colibri = false;
  bool get colibri => _colibri;
  set colibri(bool value) {
    _colibri = value;
  }

  bool _panthere = false;
  bool get panthere => _panthere;
  set panthere(bool value) {
    _panthere = value;
  }

  bool _ours = false;
  bool get ours => _ours;
  set ours(bool value) {
    _ours = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
