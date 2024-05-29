import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'de'];

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
  }) =>
      [frText, enText, deText][languageIndex] ?? '';

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
    },
    'ly7rvitm': {
      'fr': 'Facile',
      'de': 'Einfach',
      'en': 'Easy',
    },
    'q5fn3fsz': {
      'fr': 'Difficile',
      'de': 'Schwierig',
      'en': 'Difficult',
    },
    '1km6knrf': {
      'fr': 'Continuer',
      'de': 'Weitermachen',
      'en': 'Continue',
    },
    'l3dg3sze': {
      'fr': '8 ans et plus',
      'de': '8 Jahre und älter',
      'en': '8 years and over',
    },
    '8e6so0wr': {
      'fr': '1 à 7 ans',
      'de': '1 bis 7 Jahre',
      'en': '1 to 7 years',
    },
    'ojfg8c3h': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // Timer
  {
    'hn7bs33d': {
      'fr': 'Choisissez la durée du compte à rebours',
      'de': 'Wählen Sie die Countdown-Dauer',
      'en': 'Choose the countdown duration',
    },
    'sh22z9ht': {
      'fr': '1h',
      'de': '1h',
      'en': '1h',
    },
    '7ofavb6n': {
      'fr': '2h',
      'de': '2h',
      'en': '2h',
    },
    'g46hdcbm': {
      'fr': 'Compte à rebours',
      'de': 'Countdown',
      'en': 'Countdown',
    },
  },
  // Accueil
  {
    '4flophpy': {
      'fr': 'Zoovengers:',
      'de': 'Zoovengers:',
      'en': 'Zoovengers:',
    },
    'tx5gnfmy': {
      'fr': 'Bienvenue dans l\'escape game',
      'de': 'Willkommen beim Escape-Spiel',
      'en': 'Welcome to the escape game',
    },
    'kig4qnvv': {
      'fr': 'Pourrez vous résoudre à temps les puzzles ?',
      'de': 'Kannst du die Rätsel rechtzeitig lösen?',
      'en': 'Can you solve the puzzles in time?',
    },
    '23vakbx8': {
      'fr': 'Accueil',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // Decryptek
  {
    'tqoumjk3': {
      'fr': 'Decryptek',
      'de': 'Decryptek',
      'en': 'Decryptek',
    },
    '21s8o4jm': {
      'fr':
          'Bienvenue sur le decryptek! Utiliser le pour déchiffrer les codes et résoudre les énigmes. Bonne chance!',
      'de':
          'Willkommen bei decryptek! Verwenden Sie es, um Codes zu entschlüsseln und Rätsel zu lösen. Viel Glück!',
      'en':
          'Welcome to decryptek! Use it to decipher codes and solve puzzles. Good luck!',
    },
    'f2y9mbrm': {
      'fr': 'Decryptek',
      'de': 'Decryptek',
      'en': 'Decryptek',
    },
  },
  // password
  {
    'fpbw0kur': {
      'fr': 'Back',
      'de': 'Zurück',
      'en': 'Back',
    },
    'l1l2i0hl': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
    },
    'a58qj8yn': {
      'fr': 'Attention vous n\'avez le droit qu\'a 3 tentatives !',
      'de': 'Bitte beachten Sie, dass Ihnen nur 3 Versuche erlaubt sind!',
      'en': 'Please note you are only allowed 3 attempts!',
    },
    'nnp78pgq': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
    },
    'kv7244ty': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'dgo58x3p': {
      'fr': 'Chargement',
      'de': 'Wird geladen',
      'en': 'Loading',
    },
    'h34b9tpi': {
      'fr': 'Envoi des fichiers sur la base de données:',
      'de': '',
      'en': '',
    },
    '5e0dkiuf': {
      'fr': 'Envoyer:',
      'de': 'Schicken:',
      'en': 'Send:',
    },
    'jrcins5k': {
      'fr': 'Mots de passe',
      'de': 'Passwörter',
      'en': 'Passwords',
    },
  },
  // GameOver
  {
    'me9kbrcb': {
      'fr': 'Game Over',
      'de': 'Spiel vorbei',
      'en': 'Game Over',
    },
    '5fys4m2n': {
      'fr': 'Vous ne vous êtes pas échappez à temps',
      'de': 'Du bist nicht rechtzeitig entkommen',
      'en': 'You didn\'t escape in time',
    },
    'n7c8br8i': {
      'fr': 'Try Again',
      'de': 'Versuchen Sie es erneut',
      'en': 'Try Again',
    },
  },
  // Win
  {
    '910ep2k8': {
      'fr': 'Félicitation',
      'de': 'Glückwunsch',
      'en': 'Congratulations',
    },
    '0qttfj54': {
      'fr': 'Vous avez réussi à retrouvez tout les animaux manquant !',
      'de': 'Sie haben es geschafft, alle fehlenden Tiere zu finden!',
      'en': 'You have managed to find all the missing animals!',
    },
    'pzor89sk': {
      'fr': 'Go Home',
      'de': 'Nach Hause gehen',
      'en': 'Go Home',
    },
  },
  // Scan
  {
    '3ys739fc': {
      'fr': 'Placez le qr code au milieu du rectangle pour scanner l\'adn.',
      'de': '',
      'en': '',
    },
    'mj2zm0k2': {
      'fr': 'Start Scanning',
      'de': '',
      'en': '',
    },
    'dmvdpma6': {
      'fr': 'Annuler',
      'de': '',
      'en': '',
    },
    'przuw6rp': {
      'fr': 'Scan QR Code',
      'de': '',
      'en': '',
    },
    '2t6ado82': {
      'fr': 'Scan',
      'de': '',
      'en': '',
    },
  },
  // Enigmes
  {
    'kb2gx9ki': {
      'fr': 'fantome',
      'de': '',
      'en': '',
    },
    '9v6c5e2m': {
      'fr': 'eclair',
      'de': '',
      'en': '',
    },
    '8kntvy5u': {
      'fr': 'tasmanie',
      'de': '',
      'en': '',
    },
    '2077hesm': {
      'fr': 'marsupial',
      'de': '',
      'en': '',
    },
    'kae5yyd8': {
      'fr': 'berserk',
      'de': '',
      'en': '',
    },
    's4mzzcnt': {
      'fr': 'Enigmes',
      'de': '',
      'en': '',
    },
    'x7pnqojq': {
      'fr': 'enigmes',
      'de': '',
      'en': '',
    },
  },
  // projetBerserk
  {
    '8iz0hrn6': {
      'fr': 'PROJET BERSERK',
      'de': '',
      'en': '',
    },
    'zdhuaqtm': {
      'fr': 'veuillez inserer le code du projet',
      'de': '',
      'en': '',
    },
    'hkgj5q1s': {
      'fr': 'code secret',
      'de': '',
      'en': '',
    },
    'mrtzag47': {
      'fr': 'valider',
      'de': '',
      'en': '',
    },
    'yrep6uug': {
      'fr': 'BERSERK',
      'de': '',
      'en': '',
    },
    'bfn2kbmh': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // projetTasmanie
  {
    '0axoixm6': {
      'fr': 'PROJET TASMANIE',
      'de': '',
      'en': '',
    },
    'rl6x81ff': {
      'fr': 'veuillez inserer le code du projet',
      'de': '',
      'en': '',
    },
    'yy577qv4': {
      'fr': 'code secret',
      'de': '',
      'en': '',
    },
    'ymjxfcil': {
      'fr': 'valider',
      'de': '',
      'en': '',
    },
    '1s344ngj': {
      'fr': 'TASMANIE',
      'de': '',
      'en': '',
    },
    'k885el7s': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // projetMarsupial
  {
    'ze66he32': {
      'fr': 'PROJET MARSUPIAL',
      'de': '',
      'en': '',
    },
    '06vy7hfd': {
      'fr': 'veuillez inserer le code du projet',
      'de': '',
      'en': '',
    },
    'yc7l3mq2': {
      'fr': 'code secret',
      'de': '',
      'en': '',
    },
    'vpbepcfj': {
      'fr': 'valider',
      'de': '',
      'en': '',
    },
    '1qnxw2vo': {
      'fr': 'MARSUPIAL',
      'de': '',
      'en': '',
    },
    'aqawfrhn': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // projetFantome
  {
    'fdqtpyjq': {
      'fr': 'PROJET FANTOME',
      'de': '',
      'en': '',
    },
    '8q4lfq0j': {
      'fr': 'veuillez inserer le code du projet',
      'de': '',
      'en': '',
    },
    'eio2yvyq': {
      'fr': 'code secret',
      'de': '',
      'en': '',
    },
    'bn06tfzo': {
      'fr': 'valider',
      'de': '',
      'en': '',
    },
    '3g8bbclb': {
      'fr': 'FANTOME',
      'de': '',
      'en': '',
    },
    'ty07qoo7': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // projetEclair
  {
    'xhzqdjal': {
      'fr': 'PROJET ECLAIR',
      'de': '',
      'en': '',
    },
    'gjesb6rl': {
      'fr': 'veuillez inserer le code du projet',
      'de': '',
      'en': '',
    },
    'iorygo72': {
      'fr': 'code secret',
      'de': '',
      'en': '',
    },
    '2whikijp': {
      'fr': 'valider',
      'de': '',
      'en': '',
    },
    'mq8a7vs5': {
      'fr': 'ECLAIR',
      'de': '',
      'en': '',
    },
    '31wt1dge': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // berserk
  {
    'f59wskar': {
      'fr': 'Page Title',
      'de': '',
      'en': '',
    },
    'kqwe3x1v': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // tasmanie
  {
    'zd5dqn56': {
      'fr': 'Page Title',
      'de': '',
      'en': '',
    },
    '9mhp0ar6': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // eclair
  {
    '62qmre4b': {
      'fr': 'Page Title',
      'de': '',
      'en': '',
    },
    'jqbyenv9': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // marsupial
  {
    'agluf60a': {
      'fr': 'Page Title',
      'de': '',
      'en': '',
    },
    'n5yduid3': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // fantome
  {
    'b3jx8eqq': {
      'fr': 'Page Title',
      'de': '',
      'en': '',
    },
    'asvzqm7t': {
      'fr': 'Home',
      'de': '',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'jsfto7km': {
      'fr':
          'Veuillez activez la permission d\'accéder à la caméra pour scanner les qr codes du jeu de piste.',
      'de':
          'Bitte aktivieren Sie die Berechtigung für den Zugriff auf die Kamera, um die QR-Codes der Schatzsuche zu scannen.',
      'en':
          'Please enable permission to access the camera to scan the treasure hunt QR codes.',
    },
    'h2vzqt05': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '9q7gpx0t': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '335tqb7q': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'bt2up1sh': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '8r8f8vxx': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '865oe2gf': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '4dyjnwvz': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'gz2nojld': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'hz7rcmkb': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '0cwb94e8': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'v3xat9in': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '7wfxqmz8': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'cofdmuyt': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'r75saqmp': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'bh12gy3m': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '8sy262ec': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'pmsh8znu': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'swq5pezx': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'rorybedz': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '6rvy43jf': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'rdyo5tw7': {
      'fr': '',
      'de': '',
      'en': '',
    },
    '39nknc8k': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'jabsum65': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'fj5kvtaj': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'fc2cw25o': {
      'fr': '',
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
