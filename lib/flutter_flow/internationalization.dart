import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'de', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? deText = '',
    String? esText = '',
  }) =>
      [frText, enText, deText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Start
  {
    '711x0j05': {
      'fr': 'Zoovengers Escape game',
      'de': 'Zoovengers Escape-Spiel',
      'en': 'Zoovengers Escape game',
      'es': 'Juego Escape de los Vengadores del Zoo',
    },
    'ly7rvitm': {
      'fr': 'Facile',
      'de': 'Einfach',
      'en': 'Easy',
      'es': 'Fácil',
    },
    'q5fn3fsz': {
      'fr': 'Difficile',
      'de': 'Schwierig',
      'en': 'Difficult',
      'es': 'Difícil',
    },
    'l3dg3sze': {
      'fr': '10 ans et plus',
      'de': '10 Jahre und älter',
      'en': '10 years and over',
      'es': '10 años y más',
    },
    '8e6so0wr': {
      'fr': '7 ans',
      'de': '7 Jahre',
      'en': '7 years',
      'es': '7 años',
    },
    'ojfg8c3h': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Timer
  {
    'hn7bs33d': {
      'fr': 'Choisissez la durée du compte à rebours',
      'de': 'Wählen Sie die Countdown-Dauer',
      'en': 'Choose the countdown duration',
      'es': 'Elige la duración de la cuenta atrás',
    },
    'sh22z9ht': {
      'fr': '1h',
      'de': '1 Stunde',
      'en': '1 hour',
      'es': '1 hora',
    },
    '7ofavb6n': {
      'fr': '2h',
      'de': '2h',
      'en': '2h',
      'es': '2h',
    },
    'g46hdcbm': {
      'fr': 'Compte à rebours',
      'de': 'Countdown',
      'en': 'Countdown',
      'es': 'Cuenta atrás',
    },
  },
  // Accueil
  {
    '4flophpy': {
      'fr': 'Zoovengers:',
      'de': 'Zoovengers:',
      'en': 'Zoovengers:',
      'es': 'Vengadores del zoológico:',
    },
    'tx5gnfmy': {
      'fr': 'Bienvenue dans l\'escape game',
      'de': 'Willkommen beim Escape-Spiel',
      'en': 'Welcome to the escape game',
      'es': 'Bienvenido al juego de escape',
    },
    'kig4qnvv': {
      'fr': 'Pourrez vous résoudre à temps les puzzles ?',
      'de': 'Kannst du die Rätsel rechtzeitig lösen?',
      'en': 'Can you solve the puzzles in time?',
      'es': '¿Podrás resolver los acertijos a tiempo?',
    },
    '23vakbx8': {
      'fr': 'Accueil',
      'de': 'Willkommen',
      'en': 'Welcome',
      'es': 'bienvenida',
    },
  },
  // Decryptek
  {
    'tqoumjk3': {
      'fr': 'Decryptek',
      'de': 'Decryptek',
      'en': 'Decryptek',
      'es': 'Decryptek',
    },
    '21s8o4jm': {
      'fr':
          'Bienvenue sur le decryptek! Utiliser le pour déchiffrer les codes et résoudre les énigmes. Bonne chance!',
      'de':
          'Willkommen bei decryptek! Verwenden Sie es, um Codes zu entschlüsseln und Rätsel zu lösen. Viel Glück!',
      'en':
          'Welcome to decryptek! Use it to decipher codes and solve puzzles. Good luck!',
      'es':
          '¡Bienvenido a decryptek! Úselo para descifrar códigos y resolver acertijos. ¡Buena suerte!',
    },
    'f2y9mbrm': {
      'fr': 'Decryptek',
      'de': 'Decryptek',
      'en': 'Decryptek',
      'es': 'Decryptek',
    },
  },
  // GameOver
  {
    'me9kbrcb': {
      'fr': 'Game Over',
      'de': 'Spiel vorbei',
      'en': 'Game Over',
      'es': 'Juego terminado',
    },
    '5fys4m2n': {
      'fr': 'Vous ne vous êtes pas échappez à temps',
      'de': 'Du bist nicht rechtzeitig entkommen',
      'en': 'You didn\'t escape in time',
      'es': 'No escapaste a tiempo',
    },
    'n7c8br8i': {
      'fr': 'Try Again',
      'de': 'Versuchen Sie es erneut',
      'en': 'Try Again',
      'es': 'Intentar otra vez',
    },
  },
  // Win
  {
    '910ep2k8': {
      'fr': 'Félicitation',
      'de': 'Glückwunsch',
      'en': 'Congratulations',
      'es': 'Felicidades',
    },
    '0qttfj54': {
      'fr': 'Vous avez réussi à retrouvez tout les animaux manquant !',
      'de': 'Sie haben es geschafft, alle fehlenden Tiere zu finden!',
      'en': 'You have managed to find all the missing animals!',
      'es': '¡Has logrado encontrar todos los animales perdidos!',
    },
    'pzor89sk': {
      'fr': 'Rejouer',
      'de': 'Wiederholung',
      'en': 'Replay',
      'es': 'Repetición',
    },
  },
  // Scan
  {
    '3ys739fc': {
      'fr': 'Placez le qr code au milieu du rectangle pour scanner l\'adn.',
      'de':
          'Platzieren Sie den QR-Code in der Mitte des Rechtecks, um die DNA zu scannen.',
      'en': 'Place the QR code in the middle of the rectangle to scan the DNA.',
      'es':
          'Coloque el código QR en el medio del rectángulo para escanear el ADN.',
    },
    'mj2zm0k2': {
      'fr': 'Démarrer le scan',
      'de': 'Beginnen Sie mit dem Scannen',
      'en': 'Start scanning',
      'es': 'Iniciar escaneo',
    },
    'dmvdpma6': {
      'fr': 'Annuler',
      'de': 'Stornieren',
      'en': 'Cancel',
      'es': 'anular',
    },
    'przuw6rp': {
      'fr': 'Scan QR Code',
      'de': 'QR-Code scannen',
      'en': 'Scan QR Code',
      'es': 'Escanear código QR',
    },
    '2t6ado82': {
      'fr': 'Scan',
      'de': 'Scan',
      'en': 'Scan',
      'es': 'Escanear',
    },
  },
  // Enigmes
  {
    '8kntvy5u': {
      'fr': 'axololt',
      'de': 'Axolot',
      'en': 'axololt',
      'es': 'ajolote',
    },
    'ejqwm72z': {
      'fr': 'sentinelle',
      'de': 'Wächter',
      'en': 'sentinel',
      'es': 'centinela',
    },
    'hlxlfhqr': {
      'fr': 'simbioz',
      'de': 'simbioz',
      'en': 'simbioz',
      'es': 'simbiosis',
    },
    '4vtiu98s': {
      'fr': 'ressort',
      'de': 'Frühling',
      'en': 'spring',
      'es': 'primavera',
    },
    'it17rejo': {
      'fr': 'tasmanie',
      'de': 'Tasmanien',
      'en': 'tasmania',
      'es': 'tasmania',
    },
    'toqpqu3u': {
      'fr': 'hygrochrome',
      'de': 'hygrochrom',
      'en': 'hygrochromic',
      'es': 'higrocrómico',
    },
    'kb2gx9ki': {
      'fr': 'fantome',
      'de': 'Geist',
      'en': 'ghost',
      'es': 'fantasma',
    },
    '9v6c5e2m': {
      'fr': 'eclair',
      'de': 'Blitz',
      'en': 'flash',
      'es': 'destello',
    },
    '2077hesm': {
      'fr': 'marsupial',
      'de': 'Beuteltier',
      'en': 'marsupial',
      'es': 'marsupial',
    },
    'kae5yyd8': {
      'fr': 'berserk',
      'de': 'Berserker',
      'en': 'berserk',
      'es': 'enloquecido',
    },
    's4mzzcnt': {
      'fr': 'Enigmes',
      'de': 'Rätsel',
      'en': 'Riddles',
      'es': 'Acertijos',
    },
    'x7pnqojq': {
      'fr': 'Enigmes',
      'de': 'Rätsel',
      'en': 'Riddles',
      'es': 'Acertijos',
    },
  },
  // projetBerserk
  {
    '8iz0hrn6': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'zdhuaqtm': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'hkgj5q1s': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'mrtzag47': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    'yrep6uug': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
      'es': 'ENLOQUECIDO',
    },
    'bfn2kbmh': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetTasmanie
  {
    '0axoixm6': {
      'fr': 'PROJET TASMANIE',
      'de': 'TASMANIEN-PROJEKT',
      'en': 'TASMANIA PROJECT',
      'es': 'PROYECTO TASMANÍA',
    },
    'rl6x81ff': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'yy577qv4': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'ymjxfcil': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    '1s344ngj': {
      'fr': 'TASMANIE',
      'de': 'TASMANIEN',
      'en': 'TASMANIA',
      'es': 'TASMANÍA',
    },
    'k885el7s': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetMarsupial
  {
    'ze66he32': {
      'fr': 'PROJET MARSUPIAL',
      'de': 'Beuteltier-Projekt',
      'en': 'MARSUPIAL PROJECT',
      'es': 'PROYECTO MARSUPIAL',
    },
    '06vy7hfd': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'yc7l3mq2': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'vpbepcfj': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    '1qnxw2vo': {
      'fr': 'MARSUPIAL',
      'de': 'BEUTELTIER',
      'en': 'MARSUPIAL',
      'es': 'MARSUPIAL',
    },
    'aqawfrhn': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetFantome
  {
    'fdqtpyjq': {
      'fr': 'PROJET FANTOME',
      'de': 'GEISTERPROJEKT',
      'en': 'GHOST PROJECT',
      'es': 'PROYECTO FANTASMA',
    },
    '8q4lfq0j': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'eio2yvyq': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'bn06tfzo': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    '3g8bbclb': {
      'fr': 'FANTOME',
      'de': 'GEIST',
      'en': 'GHOST',
      'es': 'FANTASMA',
    },
    'ty07qoo7': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetEclair
  {
    'xhzqdjal': {
      'fr': 'PROJET ECLAIR',
      'de': 'FLASH-PROJEKT',
      'en': 'FLASH PROJECT',
      'es': 'PROYECTO FLASH',
    },
    'gjesb6rl': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'iorygo72': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    '2whikijp': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    'mq8a7vs5': {
      'fr': 'ECLAIR',
      'de': 'BLITZ',
      'en': 'FLASH',
      'es': 'DESTELLO',
    },
    '31wt1dge': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // berserk
  {
    'f59wskar': {
      'fr': 'berserk',
      'de': 'Berserker',
      'en': 'berserk',
      'es': 'enloquecido',
    },
    'kqwe3x1v': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // tasmanie
  {
    'zd5dqn56': {
      'fr': 'tasmanie',
      'de': 'Tasmanien',
      'en': 'tasmania',
      'es': 'tasmania',
    },
    '9mhp0ar6': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // eclair
  {
    '62qmre4b': {
      'fr': 'eclair',
      'de': 'Blitz',
      'en': 'flash',
      'es': 'destello',
    },
    'jqbyenv9': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // marsupial
  {
    'agluf60a': {
      'fr': 'marsupial',
      'de': 'Beuteltier',
      'en': 'marsupial',
      'es': 'marsupial',
    },
    'n5yduid3': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // fantome
  {
    'b3jx8eqq': {
      'fr': 'fantome',
      'de': 'Geist',
      'en': 'ghost',
      'es': 'fantasma',
    },
    'asvzqm7t': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // axololth
  {
    'qflitt38': {
      'fr': 'axoloth',
      'de': 'Axoloth',
      'en': 'axoloth',
      'es': 'ajolote',
    },
    '7p94u5hd': {
      'fr': 'utiliser le decriptek afin de resoudre l\'enigme',
      'de': 'Benutze den Decriptek, um das Rätsel zu lösen',
      'en': 'use the decriptek to solve the enigma',
      'es': 'Usa el decriptek para resolver el enigma.',
    },
    'qb2anhgc': {
      'fr': 'votre reponse',
      'de': 'Deine Antwort',
      'en': 'your answer',
      'es': 'su respuesta',
    },
    '25xf1bud': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetAxoloth
  {
    'nw8vnig1': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'q6tiw5fy': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'lyl3jn5j': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'cxjlvdfr': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    'yth6ql8r': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
      'es': 'ENLOQUECIDO',
    },
    'nchhdzng': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // symbiose
  {
    'akf0izqf': {
      'fr': 'symbioz',
      'de': 'Symbioz',
      'en': 'symbioz',
      'es': 'simbionte',
    },
    'ixdnpqid': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetSimbiose
  {
    '1ux7sw86': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'ppfll7j1': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'dhbe67by': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'v7fqjwf9': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    'wt1r6ojd': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
      'es': 'ENLOQUECIDO',
    },
    '2enwg85i': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // sentinelle
  {
    '4mp1bfmh': {
      'fr': 'sentinelle',
      'de': 'Wächter',
      'en': 'sentinel',
      'es': 'centinela',
    },
    't0fhjx9w': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetSentinelle
  {
    'ouo2j63o': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'z1aba3j4': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    '6p4u828w': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    'xvxi0wfa': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    '95q9suci': {
      'fr': 'sentinelle',
      'de': 'Wächter',
      'en': 'sentinel',
      'es': 'centinela',
    },
    'xljbqgkt': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ressort
  {
    'hfaap6l6': {
      'fr': 'ressort',
      'de': 'Frühling',
      'en': 'spring',
      'es': 'primavera',
    },
    '8aw5os4m': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetRessort
  {
    'css087sx': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'j993mpzn': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'zzkav8aq': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    '8rgqh8sv': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    '7np2914y': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
      'es': 'ENLOQUECIDO',
    },
    '7mewlwci': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // hygrochrome
  {
    'phjl1iwc': {
      'fr': 'hygrochrome',
      'de': 'Hygrochrom',
      'en': 'hygrochromic',
      'es': 'higrocrómico',
    },
    'd3quih9r': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetHygrochrome
  {
    '54zme012': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
      'es': 'PROYECTO BERSERK',
    },
    'bskm090k': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
      'es': 'por favor inserte el código del proyecto',
    },
    'sup9ppz9': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
      'es': 'código secreto',
    },
    '9feteob4': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
      'es': 'validar',
    },
    'ljui0b2m': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
      'es': 'ENLOQUECIDO',
    },
    '2igxqsb8': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // password
  {
    '2oun6orm': {
      'fr': 'Back',
      'de': 'Zurück',
      'en': 'Back',
      'es': 'Atrás',
    },
    'zx2l5tcm': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
      'es': 'Contraseñas finales:',
    },
    '0eejz8ik': {
      'fr': 'Attention vous n\'avez le droit qu\'a 3 tentatives !',
      'de': 'Bitte beachten Sie, dass Ihnen nur 3 Versuche erlaubt sind!',
      'en': 'Please note you are only allowed 3 attempts!',
      'es': '¡Tenga en cuenta que solo se le permiten 3 intentos!',
    },
    'r90vn38u': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
      'es': 'Contraseñas finales:',
    },
    'u02o7izy': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'i2y6xlm4': {
      'fr': 'Envoyer:',
      'de': 'Schicken:',
      'en': 'Send:',
      'es': 'Enviar a:',
    },
    'l1yiy5pz': {
      'fr': 'Final',
      'de': 'Finale',
      'en': 'Final',
      'es': 'Final',
    },
  },
  // Miscellaneous
  {
    'obh009ze': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'jsfto7km': {
      'fr':
          'Veuillez activez la permission d\'accéder à la caméra pour scanner les qr codes du jeu de piste.',
      'de':
          'Bitte aktivieren Sie die Berechtigung für den Zugriff auf die Kamera, um die QR-Codes der Schatzsuche zu scannen.',
      'en':
          'Please enable permission to access the camera to scan the treasure hunt QR codes.',
      'es':
          'Habilite el permiso para acceder a la cámara y escanear los códigos QR de la búsqueda del tesoro.',
    },
    'h2vzqt05': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '9q7gpx0t': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '335tqb7q': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'bt2up1sh': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '8r8f8vxx': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '865oe2gf': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '4dyjnwvz': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'gz2nojld': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'hz7rcmkb': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '0cwb94e8': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'v3xat9in': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '7wfxqmz8': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'cofdmuyt': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'r75saqmp': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'bh12gy3m': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '8sy262ec': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'pmsh8znu': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'swq5pezx': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'rorybedz': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '6rvy43jf': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'rdyo5tw7': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '39nknc8k': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'jabsum65': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'fj5kvtaj': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'fc2cw25o': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
