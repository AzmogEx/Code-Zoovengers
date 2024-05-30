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
      'de': '1 Stunde',
      'en': '1 hour',
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
      'de': 'Willkommen',
      'en': 'Welcome',
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
      'fr': 'Rejouer',
      'de': 'Wiederholung',
      'en': 'Replay',
    },
  },
  // Scan
  {
    '3ys739fc': {
      'fr': 'Placez le qr code au milieu du rectangle pour scanner l\'adn.',
      'de':
          'Platzieren Sie den QR-Code in der Mitte des Rechtecks, um die DNA zu scannen.',
      'en': 'Place the QR code in the middle of the rectangle to scan the DNA.',
    },
    'mj2zm0k2': {
      'fr': 'Démarrer le scan',
      'de': 'Beginnen Sie mit dem Scannen',
      'en': 'Start scanning',
    },
    'dmvdpma6': {
      'fr': 'Annuler',
      'de': 'Stornieren',
      'en': 'Cancel',
    },
    'przuw6rp': {
      'fr': 'Scan QR Code',
      'de': 'QR-Code scannen',
      'en': 'Scan QR Code',
    },
    '2t6ado82': {
      'fr': 'Scan',
      'de': 'Scan',
      'en': 'Scan',
    },
  },
  // Enigmes
  {
    '8kntvy5u': {
      'fr': 'axoloth',
      'de': 'Axoloth',
      'en': 'axoloth',
    },
    'ejqwm72z': {
      'fr': 'sentinelle',
      'de': 'Wächter',
      'en': 'sentinel',
    },
    'hlxlfhqr': {
      'fr': 'simbioz',
      'de': 'simbioz',
      'en': 'simbioz',
    },
    '4vtiu98s': {
      'fr': 'ressort',
      'de': 'Frühling',
      'en': 'spring',
    },
    'it17rejo': {
      'fr': 'tasmanie',
      'de': 'Tasmanien',
      'en': 'tasmania',
    },
    'toqpqu3u': {
      'fr': 'hygrochrome',
      'de': 'hygrochrom',
      'en': 'hygrochromic',
    },
    'kb2gx9ki': {
      'fr': 'fantome',
      'de': 'Geist',
      'en': 'ghost',
    },
    '9v6c5e2m': {
      'fr': 'eclair',
      'de': 'Blitz',
      'en': 'flash',
    },
    '2077hesm': {
      'fr': 'marsupial',
      'de': 'Beuteltier',
      'en': 'marsupial',
    },
    'kae5yyd8': {
      'fr': 'berserk',
      'de': 'Berserker',
      'en': 'berserk',
    },
    's4mzzcnt': {
      'fr': 'Enigmes',
      'de': 'Rätsel',
      'en': 'Riddles',
    },
    'x7pnqojq': {
      'fr': 'Enigmes',
      'de': 'Rätsel',
      'en': 'Riddles',
    },
  },
  // projetBerserk
  {
    '8iz0hrn6': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'zdhuaqtm': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'hkgj5q1s': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'mrtzag47': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    'yrep6uug': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    'bfn2kbmh': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetTasmanie
  {
    '0axoixm6': {
      'fr': 'PROJET TASMANIE',
      'de': 'TASMANIEN-PROJEKT',
      'en': 'TASMANIA PROJECT',
    },
    'rl6x81ff': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'yy577qv4': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'ymjxfcil': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    '1s344ngj': {
      'fr': 'TASMANIE',
      'de': 'TASMANIEN',
      'en': 'TASMANIA',
    },
    'k885el7s': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetMarsupial
  {
    'ze66he32': {
      'fr': 'PROJET MARSUPIAL',
      'de': 'Beuteltier-Projekt',
      'en': 'MARSUPIAL PROJECT',
    },
    '06vy7hfd': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'yc7l3mq2': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'vpbepcfj': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    '1qnxw2vo': {
      'fr': 'MARSUPIAL',
      'de': 'BEUTELTIER',
      'en': 'MARSUPIAL',
    },
    'aqawfrhn': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetFantome
  {
    'fdqtpyjq': {
      'fr': 'PROJET FANTOME',
      'de': 'GEISTERPROJEKT',
      'en': 'GHOST PROJECT',
    },
    '8q4lfq0j': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'eio2yvyq': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'bn06tfzo': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    '3g8bbclb': {
      'fr': 'FANTOME',
      'de': 'GEIST',
      'en': 'GHOST',
    },
    'ty07qoo7': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetEclair
  {
    'xhzqdjal': {
      'fr': 'PROJET ECLAIR',
      'de': 'FLASH-PROJEKT',
      'en': 'FLASH PROJECT',
    },
    'gjesb6rl': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'iorygo72': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    '2whikijp': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    'mq8a7vs5': {
      'fr': 'ECLAIR',
      'de': 'BLITZ',
      'en': 'FLASH',
    },
    '31wt1dge': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // berserk
  {
    'f59wskar': {
      'fr': 'berserk',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    'kqwe3x1v': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // tasmanie
  {
    'zd5dqn56': {
      'fr': 'tasmanie',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    '9mhp0ar6': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // eclair
  {
    '62qmre4b': {
      'fr': 'eclair',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    'jqbyenv9': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // marsupial
  {
    'agluf60a': {
      'fr': 'marsupial',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    'n5yduid3': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // fantome
  {
    'b3jx8eqq': {
      'fr': 'fantome',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    'asvzqm7t': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // axololth
  {
    'qflitt38': {
      'fr': 'axoloth',
      'de': 'Axoloth',
      'en': 'axoloth',
    },
    '7p94u5hd': {
      'fr': 'utiliser le decriptek afin de resoudre l\'enigme',
      'de': '',
      'en': '',
    },
    'qb2anhgc': {
      'fr': 'votre reponse',
      'de': '',
      'en': '',
    },
    '25xf1bud': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetAxoloth
  {
    'nw8vnig1': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'q6tiw5fy': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'lyl3jn5j': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'cxjlvdfr': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    'yth6ql8r': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    'nchhdzng': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // symbiose
  {
    'akf0izqf': {
      'fr': 'symbioz',
      'de': 'Symbioz',
      'en': 'symbioz',
    },
    'ixdnpqid': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetSimbiose
  {
    '1ux7sw86': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'ppfll7j1': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'dhbe67by': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'v7fqjwf9': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    'wt1r6ojd': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    '2enwg85i': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // sentinelle
  {
    '4mp1bfmh': {
      'fr': 'sentinelle',
      'de': 'Wächter',
      'en': 'sentinel',
    },
    't0fhjx9w': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetSentinelle
  {
    'ouo2j63o': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'z1aba3j4': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    '6p4u828w': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    'xvxi0wfa': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    '95q9suci': {
      'fr': 'sentinelle',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    'xljbqgkt': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // ressort
  {
    'hfaap6l6': {
      'fr': 'ressort',
      'de': 'Frühling',
      'en': 'spring',
    },
    '8aw5os4m': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetRessort
  {
    'css087sx': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'j993mpzn': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'zzkav8aq': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    '8rgqh8sv': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    '7np2914y': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    '7mewlwci': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // hygrochrome
  {
    'phjl1iwc': {
      'fr': 'hygrochrome',
      'de': 'Seitentitel',
      'en': 'Page Title',
    },
    'd3quih9r': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // projetHygrochrome
  {
    '54zme012': {
      'fr': 'PROJET BERSERK',
      'de': 'BERSERKER-PROJEKT',
      'en': 'BERSERK PROJECT',
    },
    'bskm090k': {
      'fr': 'veuillez inserer le code du projet',
      'de': 'Bitte geben Sie den Projektcode ein',
      'en': 'please insert the project code',
    },
    'sup9ppz9': {
      'fr': 'code secret',
      'de': 'Geheim Code',
      'en': 'secret code',
    },
    '9feteob4': {
      'fr': 'valider',
      'de': 'bestätigen',
      'en': 'to validate',
    },
    'ljui0b2m': {
      'fr': 'BERSERK',
      'de': 'BERSERKER',
      'en': 'BERSERK',
    },
    '2igxqsb8': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
    },
  },
  // password
  {
    '2oun6orm': {
      'fr': 'Back',
      'de': 'Zurück',
      'en': 'Back',
    },
    'zx2l5tcm': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
    },
    '0eejz8ik': {
      'fr': 'Attention vous n\'avez le droit qu\'a 3 tentatives !',
      'de': 'Bitte beachten Sie, dass Ihnen nur 3 Versuche erlaubt sind!',
      'en': 'Please note you are only allowed 3 attempts!',
    },
    'r90vn38u': {
      'fr': 'Mots de passe final:',
      'de': 'Endgültige Passwörter:',
      'en': 'Final passwords:',
    },
    'u02o7izy': {
      'fr': '',
      'de': '',
      'en': '',
    },
    'i2y6xlm4': {
      'fr': 'Envoyer:',
      'de': 'Schicken:',
      'en': 'Send:',
    },
    'l1yiy5pz': {
      'fr': 'Final',
      'de': 'Finale',
      'en': 'Final',
    },
  },
  // Miscellaneous
  {
    'obh009ze': {
      'fr': '',
      'de': '',
      'en': '',
    },
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
