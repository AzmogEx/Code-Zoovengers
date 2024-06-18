import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'es'];

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
    String? esText = '',
  }) =>
      [frText, enText, esText][languageIndex] ?? '';

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
      'es': 'Juego Escape de los Vengadores del Zoo',
    },
    'ly7rvitm': {
      'fr': 'Apprenti Zoovengers',
      'en': 'Zoovengers Apprentice',
      'es': 'Aprendiz de los Vengadores del Zoo',
    },
    'q5fn3fsz': {
      'fr': 'Expert Zoovengers',
      'en': 'Expert',
      'es': 'Experto',
    },
    'l3dg3sze': {
      'fr': '10ans +',
      'en': '10 years and over',
      'es': '10 años y más',
    },
    '8e6so0wr': {
      'fr':
          'Attention : le choix de la difficulté aura un impact sur votre expérience de jeu. Choisissez judicieusement, car cela influencera le défi et l\'intensité de votre partie !',
      'en': '7 years',
      'es': '7 años',
    },
    '22xd5sx7': {
      'fr': '7 ans',
      'en': '7 years',
      'es': '7 años',
    },
    'ojfg8c3h': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Timer
  {
    'sh22z9ht': {
      'fr': '1h',
      'en': '1 hour',
      'es': '1 hora',
    },
    '7ofavb6n': {
      'fr': '2h',
      'en': '2h',
      'es': '2h',
    },
    'hn7bs33d': {
      'fr': 'Choisissez la durée du compte à rebours',
      'en': 'Choose the countdown duration',
      'es': 'Elige la duración de la cuenta atrás',
    },
    '47hbjogc': {
      'fr':
          'Attention : si l\'application se ferme, vous perdrez votre progression et toutes vos données. Faites attention ! La mission échouera.',
      'en': '',
      'es': '',
    },
    'g46hdcbm': {
      'fr': 'Compte à rebours',
      'en': 'Countdown',
      'es': 'Cuenta atrás',
    },
  },
  // Accueil
  {
    '4flophpy': {
      'fr': 'Zoovengers',
      'en': 'Zoovengers:',
      'es': 'Vengadores del zoológico:',
    },
    'tx5gnfmy': {
      'fr': 'L\'agence zoovengers vous souhaite la bienvenue',
      'en': 'The zoovengers agency welcomes you',
      'es': 'La agencia zoovengers te da la bienvenida.',
    },
    'kig4qnvv': {
      'fr': 'Pourrez vous résoudre à temps les puzzles ?',
      'en': 'Can you solve the puzzles in time?',
      'es': '¿Podrás resolver los acertijos a tiempo?',
    },
    '9r2cp5f0': {
      'fr': 'Code: ',
      'en': 'Coded:',
      'es': 'Codificado:',
    },
    '23vakbx8': {
      'fr': 'Accueil',
      'en': 'Welcome',
      'es': 'bienvenida',
    },
  },
  // Decryptek
  {
    'tqoumjk3': {
      'fr': 'Decryptek',
      'en': 'Decryptek',
      'es': 'Decryptek',
    },
    '21s8o4jm': {
      'fr':
          'Bienvenue sur le decryptek! Utiliser le pour déchiffrer les codes et résoudre les énigmes. Bonne chance! (Uniquement pour la difficutlé Expert)',
      'en':
          'Welcome to decryptek! Use it to decipher codes and solve puzzles. Good luck! (Only for Expert difficulty)',
      'es':
          '¡Bienvenido a decryptek! Úselo para descifrar códigos y resolver acertijos. ¡Buena suerte! (Solo para dificultad Experto)',
    },
    '73rm5fhi': {
      'fr':
          'Cette fonctionnalité est réservée aux modes de difficulté plus élevés. Vous pourrez tenter votre chance à un autre moment.',
      'en': '',
      'es': '',
    },
    'f2y9mbrm': {
      'fr': 'Decryptek',
      'en': 'Decryptek',
      'es': 'Decryptek',
    },
  },
  // GameOver
  {
    'me9kbrcb': {
      'fr': 'GAME OVER',
      'en': 'GAME OVER',
      'es': 'JUEGO TERMINADO',
    },
    '5fys4m2n': {
      'fr': 'Vous ne vous êtes pas échappez à temps',
      'en': 'You didn\'t escape in time',
      'es': 'No escapaste a tiempo',
    },
    'n7c8br8i': {
      'fr': 'réessayer',
      'en': 'try again',
      'es': 'Volver a intentar',
    },
  },
  // Win
  {
    '910ep2k8': {
      'fr': 'Félicitation',
      'en': 'Congratulations',
      'es': 'Felicidades',
    },
    '0qttfj54': {
      'fr': 'Vous avez réussi à retrouvez tout les animaux manquant !',
      'en': 'You have managed to find all the missing animals!',
      'es': '¡Has logrado encontrar todos los animales perdidos!',
    },
    'pzor89sk': {
      'fr': 'Continuer ?',
      'en': 'Continue ?',
      'es': 'Seguir ?',
    },
    '5cvalrt8': {
      'fr': 'Rejouer',
      'en': 'Replay',
      'es': 'Repetición',
    },
  },
  // Scan
  {
    '3ys739fc': {
      'fr': 'Placez le qr code au milieu du rectangle pour scanner l\'adn.',
      'en': 'Place the QR code in the middle of the rectangle to scan the DNA.',
      'es':
          'Coloque el código QR en el medio del rectángulo para escanear el ADN.',
    },
    'mj2zm0k2': {
      'fr': 'Démarrer le scan',
      'en': 'Start scanning',
      'es': 'Iniciar escaneo',
    },
    'dmvdpma6': {
      'fr': 'Annuler',
      'en': 'Cancel',
      'es': 'anular',
    },
    'przuw6rp': {
      'fr': 'Scan QR Code',
      'en': 'Scan QR Code',
      'es': 'Escanear código QR',
    },
    '2t6ado82': {
      'fr': 'Scan',
      'en': 'Scan',
      'es': 'Escanear',
    },
  },
  // Enigmes
  {
    '8kntvy5u': {
      'fr': 'NUIT NOIR',
      'en': 'BLACK NIGHT',
      'es': 'NOCHE NEGRA',
    },
    'ejqwm72z': {
      'fr': 'SENTINELLE',
      'en': 'SENTINEL',
      'es': 'CENTINELA',
    },
    'hlxlfhqr': {
      'fr': 'SYMBIOZ',
      'en': 'SYMBIOZ',
      'es': 'SIMBIOZ',
    },
    '4vtiu98s': {
      'fr': 'RESSORT',
      'en': 'SPRING',
      'es': 'PRIMAVERA',
    },
    'it17rejo': {
      'fr': 'TASMANIE',
      'en': 'TASMANIA',
      'es': 'TASMANÍA',
    },
    'toqpqu3u': {
      'fr': 'GUERISSEUR',
      'en': 'HEALER',
      'es': 'CURADOR',
    },
    'kb2gx9ki': {
      'fr': 'FANTOME',
      'en': 'GHOST',
      'es': 'FANTASMA',
    },
    '9v6c5e2m': {
      'fr': 'ECLAIR',
      'en': 'FLASH',
      'es': 'DESTELLO',
    },
    '2077hesm': {
      'fr': 'MARSUPIAL',
      'en': 'MARSUPIAL',
      'es': 'MARSUPIAL',
    },
    'kae5yyd8': {
      'fr': 'BERSERKER',
      'en': 'BERSERKER',
      'es': 'FRENÉTICO',
    },
    's4mzzcnt': {
      'fr': 'Enigmes',
      'en': 'Riddles',
      'es': 'Acertijos',
    },
    'x7pnqojq': {
      'fr': 'Enigmes',
      'en': 'Riddles',
      'es': 'Acertijos',
    },
  },
  // projetBerserk
  {
    'yrep6uug': {
      'fr': 'BERSERKER',
      'en': 'BERSERKER',
      'es': 'FRENÉTICO',
    },
    '2ziuo8dl': {
      'fr': 'PROJET BERSERKER',
      'en': 'BERSERKER PROJECT',
      'es': 'PROYECTO BERSERKER',
    },
    'wt2hm79s': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'h2j348ul': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    '1pzzwabi': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'bfn2kbmh': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // password
  {
    '2oun6orm': {
      'fr': 'Back',
      'en': 'Back',
      'es': 'Atrás',
    },
    'zx2l5tcm': {
      'fr': 'MOT DE PASSE FINAL:',
      'en': 'FINAL PASSWORD:',
      'es': 'CONTRASEÑA FINAL:',
    },
    'r90vn38u': {
      'fr': 'Mots de passe final:',
      'en': 'Final passwords:',
      'es': 'Contraseñas finales:',
    },
    'u02o7izy': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'i2y6xlm4': {
      'fr': 'Envoyer:',
      'en': 'Send:',
      'es': 'Enviar a:',
    },
    'l1yiy5pz': {
      'fr': 'Final',
      'en': 'Final',
      'es': 'Final',
    },
  },
  // projetEclair
  {
    'q8zdcudy': {
      'fr': 'ECLAIR',
      'en': 'FLASH',
      'es': 'DESTELLO',
    },
    'rm80b295': {
      'fr': 'PROJET ECLAIR',
      'en': 'FLASH PROJECT',
      'es': 'PROYECTO FLASH',
    },
    'qggbt4m9': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    '8h7kssyj': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'lw8iwpgh': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'lstxbig5': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetFantome
  {
    'vf45em74': {
      'fr': 'FANTOME',
      'en': 'GHOST',
      'es': 'FANTASMA',
    },
    'oltue32d': {
      'fr': 'PROJET FANTOME',
      'en': 'GHOST PROJECT',
      'es': 'PROYECTO FANTASMA',
    },
    'k4w0fllj': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    '4dosy5ds': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'gj2zf0lr': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '2765r1bu': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetNuit
  {
    '8emgfua1': {
      'fr': 'NUIT NOIR',
      'en': 'BLACK NIGHT',
      'es': 'NOCHE NEGRA',
    },
    'cnrmfgx4': {
      'fr': 'PROJET NUIT NOIR',
      'en': 'NIGHT BLACK PROJECT',
      'es': 'PROYECTO NOCHE NEGRA',
    },
    'xpbvbsnb': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'gobj1gcs': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'fspy1odi': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '2cns9z59': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetRessort
  {
    'wvwfzvtk': {
      'fr': 'RESSORT',
      'en': 'SPRING',
      'es': 'PRIMAVERA',
    },
    'a8wf24i7': {
      'fr': 'PROJET RESSORT',
      'en': 'SPRING PROJECT',
      'es': 'PROYECTO DE PRIMAVERA',
    },
    'r7gkorir': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'zsbb6lks': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'kdugha3o': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '1wscl5yp': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetSentinelle
  {
    'poaz51z9': {
      'fr': 'SENTINELLE',
      'en': 'SENTINEL',
      'es': 'CENTINELA',
    },
    'l3zkbzdv': {
      'fr': 'PROJET SENTINELLE',
      'en': 'SENTINEL PROJECT',
      'es': 'PROYECTO CENTINELA',
    },
    'ju66758h': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    's69pos50': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'w3ioqhcl': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'nsobf8d1': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetSylbioz
  {
    'a1zpxqh8': {
      'fr': 'SYMBIOZ',
      'en': 'SYMBIOZ',
      'es': 'SIMBIOZ',
    },
    'vjevkq45': {
      'fr': 'PROJET SYMBIOZ',
      'en': 'SYMBIOZ PROJECT',
      'es': 'PROYECTO SIMBIOZ',
    },
    '0lv9bbh2': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'j6o6i3iv': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'xunlg3vv': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '7g7uq3jd': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetTasmanie
  {
    'kaic6zni': {
      'fr': 'TASMANIE',
      'en': 'TASMANIA',
      'es': 'TASMANÍA',
    },
    'su4ordwk': {
      'fr': 'PROJET TASMANIE',
      'en': 'TASMANIA PROJECT',
      'es': 'PROYECTO TASMANÍA',
    },
    '7kyojovj': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    '7v5iroat': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'ba8wrb2k': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '5f6dho03': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetMarsupial
  {
    'snfl2jhz': {
      'fr': 'MARSUPIAL',
      'en': 'MARSUPIAL',
      'es': 'MARSUPIAL',
    },
    'e0arwc1q': {
      'fr': 'PROJET MARSUPIAL',
      'en': 'MARSUPIAL PROJECT',
      'es': 'PROYECTO MARSUPIAL',
    },
    '0ki5ayyt': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'k0jqrt5c': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'v9t4z6bp': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '3zlmq69r': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projetGuerisseur
  {
    'ss60lyr1': {
      'fr': 'GUERISSEUR',
      'en': 'HEALER',
      'es': 'CURADOR',
    },
    'lrkxf1oq': {
      'fr': 'PROJET GUERISSEUR',
      'en': 'HEALER PROJECT',
      'es': 'PROYECTO SANADOR',
    },
    '52xc1q1d': {
      'fr': 'Insérez le mot de passe du projet pour le déverrouiller.',
      'en': 'Insert the project password to unlock it.',
      'es': 'Inserte la contraseña del proyecto para desbloquearlo.',
    },
    'fursnqsh': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'u8zwwg3s': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '3licowbx': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // berserker
  {
    'izboco9v': {
      'fr': 'BERSERKER',
      'en': 'BERSERKER',
      'es': 'FRENÉTICO',
    },
    'xry0k6ys': {
      'fr': 'Ursus maritimus, Ours polaire',
      'en': 'Ursus maritimus, Polar bear',
      'es': 'Ursus maritimus, oso polar',
    },
    'mmezai8p': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    'ady5teap': {
      'fr': 'Le code est : Griffes suivi de Pattes.',
      'en': 'The code is: Claws followed by Paws.',
      'es': 'El código es: Garras seguidas de Patas.',
    },
    '77aib6nn': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'dmdvvmu7': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '70er3kjg': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // eclair
  {
    'tvqlbtzq': {
      'fr': 'ECLAIR',
      'en': 'FLASH',
      'es': 'DESTELLO',
    },
    'gczlzam2': {
      'fr': 'Colibri thalassinus, Colibri thalassin',
      'en': 'Hummingbird thalassinus, Hummingbird thalassin',
      'es': 'Colibrí thalassinus, Colibrí thalassinus',
    },
    'e9ap7swu': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '9y2vsct5': {
      'fr': 'Le code est : nombre de doigts total.',
      'en': 'The code is: total number of fingers.',
      'es': 'El código es: número total de dedos.',
    },
    'gjkrwkst': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    '4alel88b': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'vr81a7hs': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // fantome
  {
    'bzz3sryh': {
      'fr': 'FANTOME',
      'en': 'GHOST',
      'es': 'FANTASMA',
    },
    'yysxotfa': {
      'fr': 'Panthera uncia, Panthère des neiges',
      'en': 'Panthera uncia, Snow leopard',
      'es': 'Panthera uncia, Leopardo de las nieves',
    },
    '58vkbx2s': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '7k6zevlc': {
      'fr': 'Le code est : nombre de canines.',
      'en': 'The code is: number of canines.',
      'es': 'El código es: número de caninos.',
    },
    'd67eu2q6': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'd8bsr3hf': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'ks859cxv': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // guerisseur
  {
    '52gbfwj1': {
      'fr': 'GUERISSEUR',
      'en': 'HEALER',
      'es': 'CURADOR',
    },
    'q7n5ks2s': {
      'fr': 'Ambystoma mexicanum, Axolotl',
      'en': 'Ambystoma mexicanum, Axolotl',
      'es': 'Ambystoma mexicanum, Ajolote',
    },
    'jca7f7w6': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '69qhhcux': {
      'fr': 'Le code est : nombre de branchies.',
      'en': 'The code is: number of gills.',
      'es': 'El código es: número de branquias.',
    },
    'g95md1md': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    '1jbssr0e': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '20mewkws': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // marsupial
  {
    'l3583mkr': {
      'fr': 'MARSUPIAL',
      'en': 'MARSUPIAL',
      'es': 'MARSUPIAL',
    },
    '7d5vpy1g': {
      'fr': 'Petaurus breviceps, Sugar glider',
      'en': 'Petaurus breviceps, Sugar glider',
      'es': 'Petaurus breviceps, planeador del azúcar',
    },
    'v4ruc63z': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '0xwayj70': {
      'fr': 'Le code est : nombre de doigts total de l\'animal.',
      'en': 'The code is: total number of toes of the animal.',
      'es': 'El código es: número total de dedos del animal.',
    },
    'j2o40ju0': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'b4nbr7qh': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '5r2rzopk': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // nuit
  {
    'gwt3p0wv': {
      'fr': 'NUIT NOIR',
      'en': 'BLACK NIGHT',
      'es': 'NOCHE NEGRA',
    },
    'oe3drbim': {
      'fr': 'Pteropus niger, Roussette noire.',
      'en': 'Pteropus niger, Black flying fox.',
      'es': 'Pteropus niger, zorro volador negro.',
    },
    'l6dimyfb': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme. ',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    'v3ibkztm': {
      'fr': 'Le code est : nombre de doigts total d\'une main de l\'animal.',
      'en': 'The code is: total number of fingers on an animal\'s hand.',
      'es': 'El código es: número total de dedos de la mano de un animal.',
    },
    '0qxlkhxy': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'h6d13uia': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    '77xjekv3': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ressort
  {
    'tt43behx': {
      'fr': 'RESSORT',
      'en': 'SPRING',
      'es': 'PRIMAVERA',
    },
    'na7qbyhl': {
      'fr': 'Rupicapra rupicapra, Chamois des Alpes',
      'en': 'Rupicapra rupicapra, Alpine Chamois',
      'es': 'Rupicapra rupicapra, Gamuza Alpina',
    },
    'p1sfzdbu': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    'nt95gq4d': {
      'fr': 'Le code est : nombre de cornes X nombre de pattes.',
      'en': 'The code is: number of horns X number of legs.',
      'es': 'El código es: número de cuernos X número de patas.',
    },
    '6gtto6u9': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'z1zj35q0': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'xs6pm9sl': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // sentinelle
  {
    'plvocd0i': {
      'fr': 'SENTINELLE',
      'en': 'SENTINEL',
      'es': 'CENTINELA',
    },
    'xrp1zqn1': {
      'fr': 'Bubo bubo, Grand-duc d\'Europe',
      'en': 'Bubo bubo, European Grand Duke',
      'es': 'Bubo bubo, Gran Duque europeo',
    },
    'e8rfjiyb': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '26qkl0j5': {
      'fr': 'Le code est : nombre de doigts total de l\'animal.',
      'en': 'The code is: total number of toes of the animal.',
      'es': 'El código es: número total de dedos del animal.',
    },
    '7lycqhen': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'zguvw4fg': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'rc82aoq7': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // symbioz
  {
    '1oy7yioo': {
      'fr': 'SYMBIOZ',
      'en': 'SYMBIOZ',
      'es': 'SIMBIOZ',
    },
    'mimxrjt2': {
      'fr': 'Bradypus tridactylus, Paresseux',
      'en': 'Bradypus tridactylus, Sloth',
      'es': 'Bradypus tridactylus, Perezoso',
    },
    '9od81gnu': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    'xehmtnvz': {
      'fr': 'Le code est : nombre de griffes total X nombre de pattes.',
      'en': 'The code is: total number of claws X number of legs.',
      'es': 'El código es: número total de garras X número de patas.',
    },
    'dxkv2pp7': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'nx0iqjer': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'qlvvs283': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // tasmanie
  {
    'jwa5ckzm': {
      'fr': 'TASMANIE',
      'en': 'TASMANIA',
      'es': 'TASMANÍA',
    },
    'j770gff9': {
      'fr': 'Ornithorhynchus anatinus, Ornythorinque',
      'en': 'Platypus',
      'es': 'Ornitorrinco',
    },
    'n1hz2sus': {
      'fr':
          'Utilisez cette vidéo pour retrouver l\'animal dans le musée et résoudre la dernière énigme.',
      'en':
          'Use this video to find the animal in the museum and solve the last puzzle.',
      'es':
          'Usa este vídeo para encontrar el animal en el museo y resolver el último rompecabezas.',
    },
    '37yczxvr': {
      'fr': 'Le code est : nombre de doigts pattes avant de l\'animal.',
      'en': 'The code is: number of toes on the animal\'s front legs.',
      'es': 'El código es: número de dedos de las patas delanteras del animal.',
    },
    'pfkunl8e': {
      'fr': 'MOT DE PASSE',
      'en': 'PASSWORD',
      'es': 'CONTRASEÑA',
    },
    'af38b3sf': {
      'fr': 'VALIDER',
      'en': 'TO VALIDATE',
      'es': 'VALIDAR',
    },
    'vykcvgvg': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Miscellaneous
  {
    'obh009ze': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'jsfto7km': {
      'fr':
          'Veuillez activez la permission d\'accéder à la caméra pour scanner les qr codes du jeu de piste.',
      'en':
          'Please enable permission to access the camera to scan the treasure hunt QR codes.',
      'es':
          'Habilite el permiso para acceder a la cámara y escanear los códigos QR de la búsqueda del tesoro.',
    },
    'fiur3s0s': {
      'fr':
          'We need microphone for show you the different videos of the application',
      'en': '',
      'es': '',
    },
    'uwbmu9ew': {
      'fr':
          'We need microphone for show you the different videos of the application',
      'en': '',
      'es': '',
    },
    'h2vzqt05': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '9q7gpx0t': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '335tqb7q': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'bt2up1sh': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '8r8f8vxx': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '865oe2gf': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '4dyjnwvz': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'gz2nojld': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'hz7rcmkb': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '0cwb94e8': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'v3xat9in': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '7wfxqmz8': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'cofdmuyt': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'r75saqmp': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'bh12gy3m': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '8sy262ec': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'pmsh8znu': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'swq5pezx': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'rorybedz': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '6rvy43jf': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'rdyo5tw7': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '39nknc8k': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'jabsum65': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'fj5kvtaj': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'fc2cw25o': {
      'fr': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
