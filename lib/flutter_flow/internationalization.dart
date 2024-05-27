import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

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
  }) =>
      [frText, enText][languageIndex] ?? '';

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
      'en': 'Zoovengers Escape game',
    },
    '6u6q5k7x': {
      'fr': 'check.io',
      'en': '',
    },
    'oe8eblap': {
      'fr': 'Inbox',
      'en': '',
    },
    'rtcixv5p': {
      'fr': 'Today',
      'en': '',
    },
    '9dmbm8dh': {
      'fr': 'My Channel',
      'en': '',
    },
    'qvteron4': {
      'fr': 'Dashboard',
      'en': '',
    },
    '56xvasxt': {
      'fr': 'My Team',
      'en': '',
    },
    '8u74lw2n': {
      'fr': 'Messages',
      'en': '',
    },
    'o24g37ro': {
      'fr': 'Completed Tasks',
      'en': '',
    },
    '7l2c55y6': {
      'fr': 'Settings',
      'en': '',
    },
    '0lj84kwn': {
      'fr': 'Add Channel',
      'en': '',
    },
    'icx4tey7': {
      'fr': 'Andrew D.',
      'en': '',
    },
    '1odiy6qd': {
      'fr': 'Admin',
      'en': '',
    },
    '2a1q1ut7': {
      'fr': 'check.io',
      'en': '',
    },
    '7ptr0ot4': {
      'fr': 'Inbox',
      'en': '',
    },
    'ia55uhoo': {
      'fr': 'Today',
      'en': '',
    },
    'c6zz5c8s': {
      'fr': 'My Channel',
      'en': '',
    },
    'z2yvd0mx': {
      'fr': 'Dashboard',
      'en': '',
    },
    'xeh0h7rm': {
      'fr': 'My Team',
      'en': '',
    },
    'o6j5vbi2': {
      'fr': 'Messages',
      'en': '',
    },
    'gvb1nvxt': {
      'fr': 'Completed Tasks',
      'en': '',
    },
    'drxh35q7': {
      'fr': 'Settings',
      'en': '',
    },
    'lbuhzlyd': {
      'fr': 'Add Channel',
      'en': '',
    },
    'h447ch3s': {
      'fr': 'Andrew D.',
      'en': '',
    },
    'o8ukjgso': {
      'fr': 'Admin',
      'en': '',
    },
    'bootkuwy': {
      'fr': 'check.io',
      'en': '',
    },
    '91ibz9bx': {
      'fr': 'Inbox',
      'en': '',
    },
    'rzl6apnf': {
      'fr': 'Today',
      'en': '',
    },
    '9tswfyir': {
      'fr': 'My Channel',
      'en': '',
    },
    'u3obsqd3': {
      'fr': 'Dashboard',
      'en': '',
    },
    '98ye6gdt': {
      'fr': 'My Team',
      'en': '',
    },
    '9c1ih56b': {
      'fr': 'Messages',
      'en': '',
    },
    'k122e9uc': {
      'fr': 'Completed Tasks',
      'en': '',
    },
    '0h60a1et': {
      'fr': 'Settings',
      'en': '',
    },
    'ndvrqewb': {
      'fr': 'Add Channel',
      'en': '',
    },
    'iy8zzs6l': {
      'fr': 'Andrew D.',
      'en': '',
    },
    '03ecq417': {
      'fr': 'Admin',
      'en': '',
    },
    'ly7rvitm': {
      'fr': 'Facile',
      'en': 'Easy',
    },
    'q5fn3fsz': {
      'fr': 'Difficile',
      'en': 'Hard',
    },
    '1km6knrf': {
      'fr': 'Continuer',
      'en': 'Continue',
    },
    'ojfg8c3h': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Scan
  {
    '0ncebavc': {
      'fr': 'Scan',
      'en': '',
    },
    'e1ghil4m': {
      'fr': 'Scan',
      'en': '',
    },
  },
  // Timer
  {
    'hn7bs33d': {
      'fr': 'Choisissez la durée du compte à rebours',
      'en': 'Choose the countdown duration:',
    },
    'zrpp1o6a': {
      'fr': 'temps illimité',
      'en': 'Unlimited time',
    },
    'sh22z9ht': {
      'fr': '1h',
      'en': '',
    },
    '7ofavb6n': {
      'fr': '2h',
      'en': '',
    },
    'dftvsuku': {
      'fr': 'Retour',
      'en': 'Back',
    },
    'g46hdcbm': {
      'fr': 'Compte à rebours',
      'en': 'Countdown',
    },
  },
  // Accueil
  {
    '4flophpy': {
      'fr': 'Zoovengers:',
      'en': 'Home:',
    },
    'tx5gnfmy': {
      'fr': 'Bienvenue dans l\'escape game',
      'en': 'Welcome to the Escape Game!',
    },
    'kig4qnvv': {
      'fr': 'Pourrez vous résoudre à temps les puzzles ?',
      'en': 'Can you solve the puzzles and escape in time?',
    },
    '23vakbx8': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Decryptek
  {
    'tqoumjk3': {
      'fr': 'Decryptek',
      'en': '',
    },
    '21s8o4jm': {
      'fr':
          'Bienvenue sur le decryptek! Utiliser le pour déchiffrer les codes et résoudre les énigmes. Bonne chance!',
      'en':
          'Welcome to Decryptek! Use your skills to decipher the codes and solve the enigmas. Good luck!',
    },
    'f2y9mbrm': {
      'fr': 'Decryptek',
      'en': '',
    },
  },
  // password
  {
    'fpbw0kur': {
      'fr': 'Back',
      'en': '',
    },
    'l1l2i0hl': {
      'fr': 'Mots de passe final:',
      'en': 'Final password:',
    },
    'a58qj8yn': {
      'fr': 'Attention vous n\'avez le droit qu\'a 3 essai !',
      'en': 'Be careful, you only have 3 tries !',
    },
    'nnp78pgq': {
      'fr': 'Mots de passe final:',
      'en': 'Final password:',
    },
    'kv7244ty': {
      'fr': '',
      'en': '',
    },
    '5e0dkiuf': {
      'fr': 'Envoyer:',
      'en': 'Send',
    },
    'jrcins5k': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'h2vzqt05': {
      'fr': '',
      'en': '',
    },
    '9q7gpx0t': {
      'fr': '',
      'en': '',
    },
    '335tqb7q': {
      'fr': '',
      'en': '',
    },
    'bt2up1sh': {
      'fr': '',
      'en': '',
    },
    '8r8f8vxx': {
      'fr': '',
      'en': '',
    },
    '865oe2gf': {
      'fr': '',
      'en': '',
    },
    '4dyjnwvz': {
      'fr': '',
      'en': '',
    },
    'gz2nojld': {
      'fr': '',
      'en': '',
    },
    'hz7rcmkb': {
      'fr': '',
      'en': '',
    },
    '0cwb94e8': {
      'fr': '',
      'en': '',
    },
    'v3xat9in': {
      'fr': '',
      'en': '',
    },
    '7wfxqmz8': {
      'fr': '',
      'en': '',
    },
    'cofdmuyt': {
      'fr': '',
      'en': '',
    },
    'r75saqmp': {
      'fr': '',
      'en': '',
    },
    'bh12gy3m': {
      'fr': '',
      'en': '',
    },
    '8sy262ec': {
      'fr': '',
      'en': '',
    },
    'pmsh8znu': {
      'fr': '',
      'en': '',
    },
    'swq5pezx': {
      'fr': '',
      'en': '',
    },
    'rorybedz': {
      'fr': '',
      'en': '',
    },
    '6rvy43jf': {
      'fr': '',
      'en': '',
    },
    'rdyo5tw7': {
      'fr': '',
      'en': '',
    },
    '39nknc8k': {
      'fr': '',
      'en': '',
    },
    'jabsum65': {
      'fr': '',
      'en': '',
    },
    'fj5kvtaj': {
      'fr': '',
      'en': '',
    },
    'fc2cw25o': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
