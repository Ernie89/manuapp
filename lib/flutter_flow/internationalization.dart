import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['da', 'kl'];

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
    String? daText = '',
    String? klText = '',
  }) =>
      [daText, klText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hslltn2l': {
      'da': 'HJEM',
      'kl': 'SAQQAA',
    },
    '3bdainxv': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'py0vzg07': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    '6slpoflh': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut Ilinniarsimasunut',
    },
    'pusj9214': {
      'da': 'Nyheder',
      'kl': 'Nutaarsiassat',
    },
    'kuogbqdj': {
      'da': 'Downloads',
      'kl': 'Aanikuusat',
    },
    'kgpb1vnk': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Om_Barnet
  {
    '4ekxbc5h': {
      'da': 'Om Barnet',
      'kl': 'Meeqqat Silarsuaat',
    },
    'nc863zwb': {
      'da': 'Om Barnet',
      'kl': 'Meeqqat Silarsuuat',
    },
    'ragbairv': {
      'da': 'Barnets første år (0-1 år)',
      'kl': 'ANGAJOQQAANUT',
    },
    'dhkcc1e7': {
      'da': '1-2 ÅR',
      'kl': 'ANGAJOQQAANUT',
    },
    'bvpjyd7y': {
      'da': '3-4 ÅR',
      'kl': 'ANGAJOQQAANUT',
    },
    '6m5flpao': {
      'da': '5-6 ÅR',
      'kl': 'ANGAJOQQAANUT',
    },
    '9rgn691j': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Forealdre
  {
    'zydv0dfg': {
      'da': 'FORÆLDRE',
      'kl': 'ANGAJOQQAANUT',
    },
    'hms59nry': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'fmjom4fq': {
      'da':
          'MANU forældrebøger er bøger til dig, som er eller snart skal være far eller mor. \n\nUanset om det er dit første barn eller dit femte barn, eller om du bor i nord, syd, øst eller vest. \n\nBøgerne vil med humor og indsigt følge dig på hele din rejse i dit forældreskab, og få dig til at overveje, hvordan du selv vil være far eller mor.',
      'kl':
          'Angajoqqaanut atuakkat MANU-meersut, tassaapput ilinnut ataataasumut anaanaasumulluunniit, imaluunniit ataatanngulersumut anaananngulersumulluunniit atuakkat. \n\nApeqqutaanngilaq aatsaat meerartaalernersutit tallimassaanilluunniit meerartaalernersutit, avannaani, kujataani, kangiani kitaaniluunniit najugaqarnersutit. \n\nAtuakkat nuannersumik ilisimasaqarfiulluartumillu, angajoqqaatut inuuninni tamarmi maleruassavaatit, qanorlu ataataajumanerit anaanaajumanerilluunniit eqqarsaatigilersillugu.',
    },
    'gtuylcw2': {
      'da': 'Materiale til forældre ',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'jmz9y418': {
      'da': 'Ekstra materiale',
      'kl': 'Atortussat allat',
    },
    'a5kdua20': {
      'da': 'Animationsvideoer',
      'kl': 'Aalasuliat',
    },
    '4ktzpkjq': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Lydboger
  {
    'w8j4tb8d': {
      'da': 'Lydbøger',
      'kl': 'Tusarnaagassiat',
    },
    'e0mom9th': {
      'da': 'Lydbøger',
      'kl': 'Tusarnaagassiat',
    },
    '8j7np8rk': {
      'da': 'KALAALLISUT',
      'kl': 'KALAALLISUT',
    },
    '7yb5r9yl': {
      'da': 'Hent lydbog',
      'kl': 'Tusarnaagassiaq Aajuk',
    },
    'du7jf1mg': {
      'da': 'DANSK',
      'kl': 'QALLUNAATUT',
    },
    '5u8id5h3': {
      'da': 'Hent lydbog',
      'kl': 'Tusarnaagassiaq Aajuk',
    },
    'hqd9gx4k': {
      'da': 'Lydbøger',
      'kl': 'Tusarnaangassiat',
    },
  },
  // Kontakt
  {
    'x4528gip': {
      'da': 'Kontakt Os',
      'kl': 'Attavigisigut',
    },
    '0s4am3me': {
      'da': 'Kontakt Os',
      'kl': 'Attavigisigut',
    },
    '6bxwqy1r': {
      'da': 'MANU hovedmail:',
      'kl': 'MANU emailia:',
    },
    '6vjzhv3r': {
      'da': 'manu@nanoq.gl',
      'kl': 'manu@nanoq.gl',
    },
    'ogb7j92b': {
      'da': 'Kontakt',
      'kl': 'Attavissaq',
    },
  },
  // Indstillinger
  {
    '7sv2vlfv': {
      'da': 'Indstillinger',
      'kl': 'Inissititerneqarnera',
    },
    '9xsmsqos': {
      'da': 'Indstillinger',
      'kl': 'Inissititerneqarnera',
    },
    'c95ad3li': {
      'da': 'SKIFT TILSTAND',
      'kl': 'ISIKKUA ALLANNGORUK',
    },
    'skozvhlu': {
      'da': 'Lyst Tilstand',
      'kl': 'Qaamasoq Atoruk',
    },
    'wj1uv11q': {
      'da': 'Mørk Tilstand',
      'kl': 'Taartoq Atoruk',
    },
    'pcfk5eys': {
      'da': 'SKIFT SPROG',
      'kl': 'OQAASERTAI ALLANNGUKKIT',
    },
    'qzxgosu4': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Side1-2
  {
    '2f51grdo': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    '8xqnbclw': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'ihcje73z': {
      'da': '1-2 år',
      'kl': 'Ilisimasallit',
    },
    '43w7dbrp': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Side3-4
  {
    'jkfgfj43': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'qtx5ueqp': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'yakst579': {
      'da': '3-4 år',
      'kl': 'Ilisimasallit',
    },
    'drwbvcup': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Side5-6
  {
    'gwei39uu': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'rfa30r8v': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'eod1ho5i': {
      'da': '5-6 år',
      'kl': 'Ilisimasallit',
    },
    'h9lblmtt': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Boger_Til_Foraeldre
  {
    'ma18c8bv': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    '7mw5ajv5': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    '57lyqb5q': {
      'da': 'Materiale til forældre ',
      'kl': 'Angajoqqaanut atortussiat',
    },
    '8bi1f9gr': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut quppersagaq',
    },
    'tlup8lj0': {
      'da': 'Forældreforberedelse 0-9 mnd',
      'kl': 'Angajoqqaanngornissamut piareersarneq 0-9 mnd',
    },
    'kvvck0hw': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'l6u4aqow': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut quppersagaq',
    },
    'm3woc0vm': {
      'da': 'Barnet 1 og 2 år',
      'kl': 'Meeraq 1-nik 2-nillu ukiulik',
    },
    'fu4zlnpp': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'my4b2y37': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut quppersagaq',
    },
    'ep81hdyk': {
      'da': 'Barnet 3 og 4 år',
      'kl': 'Meeraq 3-nik 4-nillu ukiulik',
    },
    'kkzpq63v': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'mr82yxfx': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut quppersagaq',
    },
    'kchk0l0h': {
      'da': 'Barnet 5 og 6 år',
      'kl': 'Meeraq 5-nik 6-nillu ukiulik',
    },
    'hk55maua': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '8q19sajz': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'by2sbzvm': {
      'da': 'Hash information til forældre, Pjece',
      'kl': 'Hash – Angajoqqaanut paasissutissat',
    },
    'a5v9y73w': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'ro49ry1e': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '1vgw1z8n': {
      'da':
          'Information om alkohol til forældre – graviditet, amning og den nye familie. \nPjece',
      'kl':
          'Imigassaq pillugu angajoqqaanut paasissutissat – naartuneq, milutsitsineq ilaqutariinngorlaallu',
    },
    '87pxoyip': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '9hcry9nt': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '15s1bhgm': {
      'da': 'Til forældre om bedsteforældre',
      'kl': 'Angajoqqaanut aanaa aataakkut pillugit',
    },
    '9bq5ypr9': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'q9eyezh1': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Forldreforberedelse0-9mnd
  {
    'fza7w2ok': {
      'da': '0-9 måneder',
      'kl': 'Qaammatit 0-9',
    },
    '5oax3zsn': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'wjlk6ulp': {
      'da': 'Materiale til forældre ',
      'kl': 'Angajoqqaanut atortussiat',
    },
    's84z707g': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut atuakkat',
    },
    'zrv5phfv': {
      'da': 'Forældreforberedelse 0-9 mnd',
      'kl': 'Angajoqqaanngornissamut \npiareersarneq 0-9 mnd',
    },
    'vhv3rmrx': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'asi4kqrn': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Side0-1
  {
    'tisasx6y': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'hzirxa6k': {
      'da': 'Om Barnet',
      'kl': 'Ilisimasallit',
    },
    'bfh0xguf': {
      'da': '0-1 år',
      'kl': 'Ilisimasallit',
    },
    'r1ok0o0u': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Boern
  {
    '9timqtrr': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'ynmwmfyd': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    '680b9btl': {
      'da':
          'Hver gang du og dit barn er sammen om en bog, så deler I en oplevelse. Det at sidde tæt og være optaget af det, der sker i bogen, kan give fælles glæde. Og det kan give jer begge en følelse af at høre sammen. \n\nNår du læser en børnebog, er det en anledning til at tale med dit barn om det, der optager det.  \n \nHer finder du alle MANU´s Børnebøger. Til hver børnebog er der forældrehæfte til, som giver lidt viden og ideer om det pågældende emne.  ',
      'kl':
          'Meeqqallu atuakkamik sammisaqaraangassi  misigisaqaqatigiittarpusi. Qanimut issiaqatigiilluni atuakkamilu pisunik tiguartisimaaqatigiinneq nuannisaqatigiinnermik pilersitsisinnaavoq. Immissinnullu ataqatigiinnissinnik misigilersitsisinnaalluni. \n\nMeeqqat atuagaannik atuaraangavit meeqqavit ukkataa pillugu oqaloqatiginissaanut periarfissaqalertarpoq. \n \nAtaani nanisinnaavatit meeqqanut atuakkat MANU-minngaanneersut. Meeqqat atuagaat immikkut tamarmik angajoqqaanut kakkersagartaqarput, sammisamut tunngasunik paasissutissartalinnguanik isumassarsiorfiusinnaasunillu. \n',
    },
    'sh1119ny': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'nkqda0rc': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'twggh5ht': {
      'da': 'Plakat',
      'kl': 'Plakaati',
    },
    'l2jmitvi': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // ManuminafoldebogBarnetfrstebog
  {
    '60exc3lo': {
      'da': 'Manumina foldebog',
      'kl': 'Manumina atuagaaraq mappertagaq',
    },
    '0sti2r6d': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    '0hhsofai': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    't6soye9k': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'bpbbl53n': {
      'da': 'Manumina foldebog, \nBarnet første bog',
      'kl': 'Manumina atuagaaraq mappertagaq',
    },
    'ztzwf6ac': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    '1uf76wzx': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Barnet1og2
  {
    'upbb0aot': {
      'da': 'Barnet 1 og 2 år',
      'kl': 'Meeraq 1-nik 2-nillu ukiulik',
    },
    '7ne9b9ap': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'etcw4dny': {
      'da': 'Materiale til forældre',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'l0ncw2vk': {
      'da': 'Barnet 1 og 2 år',
      'kl': 'Meeraq 1-nik 2-nillu ukiulik',
    },
    'bkhyuchn': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut atuakkat',
    },
    'hzhsptm0': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '17tlg3gs': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Barnet3og4
  {
    'nbes3ox7': {
      'da': 'Barnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik 4-nillu ukiulik',
    },
    '8sz26zdp': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'gwdt3pa7': {
      'da': 'Materiale til forældre',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'g99jtuo9': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut atuakkat',
    },
    'wtsoxtud': {
      'da': 'Barnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik 4-nillu ukiulik',
    },
    'e1czi7bi': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '6crqt57t': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Barnet5og6
  {
    '2tmj98du': {
      'da': 'Barnet 5-6 år',
      'kl': 'Meeraq 5-nik 6-nillu ukiulik',
    },
    'cx023not': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    '3zqtveyi': {
      'da': 'Materiale til forældre',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'iv8ohbet': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut atuakkat',
    },
    '9biuu0jn': {
      'da': 'Barnet 5-6 år',
      'kl': 'Meeraq 5-nik 6-nillu ukiulik',
    },
    '1r59skhj': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'pgqvszrv': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Hash_information
  {
    'weg9lqku': {
      'da': 'Hash Information',
      'kl': 'Hash-imut paasissutissat',
    },
    'lz4baojr': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'up22e2hd': {
      'da': 'Materiale til forældre ',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'jg6ohxjp': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '0whmfht1': {
      'da': 'Hash information til forældre, Pjece',
      'kl': 'Hash Angajoqqaanut paasissutissat',
    },
    'hylr4xyd': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'tju1p9es': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Information_om_alkohol
  {
    'vc4u3x0l': {
      'da': 'Information Om Alkohol',
      'kl': 'imigassaq pillugu paasissutissat',
    },
    'eytam4iv': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'lgl66mht': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut atuakkat',
    },
    'h6wqtgrv': {
      'da': 'MANU',
      'kl': '',
    },
    'aszkkl66': {
      'da':
          'Information om alkohol til forældre – graviditet, amning og den nye familie. \nPjece',
      'kl':
          'MANU imigassaq pillugu angajoqqaanut paasissutissat – naartuneq, milutsitsineq ilaqutariinngorlaallu',
    },
    'enfg46op': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    '0ex98ber': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Til_forldre_om_bedsteforldre
  {
    'st0sgvxa': {
      'da': 'Til forældre om bedsteforældre',
      'kl': 'Ilisimasallit',
    },
    '9kf1a0si': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    '1xzjw8lh': {
      'da': 'Materiale til forældre',
      'kl': 'Angajoqqaanut atortussiat',
    },
    'e70eu4ef': {
      'da': 'MANU',
      'kl': '',
    },
    '36qn4rbf': {
      'da': 'Til forældre om bedsteforældre',
      'kl': '',
    },
    'wxdyjdba': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    'vencgj0r': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ekstra_materiale
  {
    'tuaw79dl': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'atln4lpy': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    '4ue740mu': {
      'da': 'Ekstra Materiale',
      'kl': 'Angajoqqaanut',
    },
    'u5ttd6t1': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'dzcbunzs': {
      'da': 'Plastickort 1-2 år',
      'kl': 'Plastickort 1-2 år',
    },
    'o2z34n6c': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '9fo1czvh': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '3oykmiex': {
      'da': 'Spilleregler 5-6 år',
      'kl': 'Pinnguaat (malittarisassat)  5-6 år',
    },
    'bi7qi891': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'cqtjdxmb': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Plastickort1-2
  {
    'nf5cwmea': {
      'da': 'Plastickort 1-2 år',
      'kl': 'Ilisimasallit',
    },
    'dmnp7flb': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'b5vdzau3': {
      'da': 'Ekstra materiale',
      'kl': 'Angajoqqaanut',
    },
    'wigr3fy5': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '8ufsf4h2': {
      'da': 'Plastickort 1-2 år',
      'kl': 'Plastickort 1-2 år',
    },
    '0m85vme3': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'ys4zr0uy': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Spilleregler5-6
  {
    '7dhoilkv': {
      'da': 'Spilleregler 5-6 år',
      'kl': 'Pinnguaat (malittarisassat) 5-6',
    },
    'glqpw8la': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'x4t7p2wc': {
      'da': 'Ekstra materiale',
      'kl': 'Atortussat allat',
    },
    'lmtz7jg1': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '98296wni': {
      'da': 'Spilleregler 5-6 år',
      'kl': 'Pinnguaat (malittarisassat) 5-6',
    },
    'n3lxiz8m': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '2ci7udmz': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Animationsvideoer
  {
    'obvclnyl': {
      'da': 'Animationsvideoer',
      'kl': 'Titartakkat Aalasuliat',
    },
    'kl1qsc00': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'qskyr0cl': {
      'da': 'Animationsvideoer',
      'kl': 'Titartakkat Aalasuliat',
    },
    'qif7l3jh': {
      'da': 'Forældreforberedelse 0-9 måneder',
      'kl':
          'Angajoqqaanngortussat piareersarnerat, \nmeeqqap inoorlaajuneraniit – qulingiluanik qaammateqalerneranut',
    },
    'cbcwjw70': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'qd50vf60': {
      'da': 'Angajoqqaanngornissamut piareersarneq, forældreforberedelse',
      'kl': 'Angajoqqaanngornissamut piareersarneq, forældreforberedelse',
    },
    'w71kx8bd': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'n231wjl1': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'uj39f689': {
      'da':
          'Pilluarit, Angajoqqaanngulerputit, \nTillykke du skal være forælder',
      'kl':
          'Pilluarit, Angajoqqaanngulerputit, \nTillykke du skal være forælder',
    },
    'gegj4jeb': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'howjyraq': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'rbbc0kit': {
      'da': 'Angajoqqaanngornissamut piareersarneq, Forældreforberedelse',
      'kl': 'Angajoqqaanngornissamut piareersarneq, Forældreforberedelse',
    },
    'w9xzz759': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'cnjijk49': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '4yyn9df2': {
      'da': 'Angajoqqanngornissamut piareersarneq, forældreforberedelse',
      'kl': 'Angajoqqanngornissamut piareersarneq, forældreforberedelse',
    },
    '25777av4': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'y17y11js': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU 1-2 ukiut',
    },
    'a62jayuv': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'bfqvfn51': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
    },
    'aipxtfc9': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '80w01f0p': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'opi3wt6t': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
    },
    '1mrihagh': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '41zcfp9c': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU 3-4 ukiut',
    },
    'oncmp8mt': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'rytbaj7f': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    '2zq0tcjx': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'w1bvc2k8': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'as0b6tpk': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'hs0zu5pv': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'cdirqpvg': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'oxmwbvoz': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'qe416zv0': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'fz0e66v8': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '2l9ogsi5': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'xelk2ely': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'j3clzz33': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'zwxso3qn': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    '4bmlx275': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'az2fvwk3': {
      'da': 'MANU 5-6 år',
      'kl': 'MANU 5-6 ukiut',
    },
    '1kz9vc5n': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'j98laa22': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
    },
    'dpion24a': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'epqpg3mi': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'voxe677t': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
    },
    'xgja3zul': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '155klnxf': {
      'da': 'MANU Hash',
      'kl': 'MANU Hash',
    },
    'a4int5hn': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '8awjxeqg': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    'qc6qg3du': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '5afx020m': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '8v0pmyrq': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    'q2gr0ff4': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '4elx39xo': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'f8e0t9rz': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    'pe31facl': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '2lv6awex': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'jch98thu': {
      'da': 'Hash Spot 3',
      'kl': 'Hash Spot 3',
    },
    'p9png05y': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '7l6d4hki': {
      'da': 'MANU Alkohol',
      'kl': 'MANU Imigassaq aalakoornartoq',
    },
    'h9ckv2f6': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'ey52oqdz': {
      'da': 'Hash Alkohol',
      'kl': 'Hash Alkohol',
    },
    'pufx60e9': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'xjo9avbh': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Fagfolk
  {
    'weixtzxx': {
      'da': 'FAGFOLK',
      'kl': 'SULISUNUT',
    },
    '0ncji0in': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'r99v8m60': {
      'da':
          'MANU bygger på kompetenceudvikling af fagpersonale, som opnår kompetencer til at undervise og gå i dialog med forældrene omkring deres barns trivsel og sundhed.\n\nMaterialet består af:\n\n - Vejledninger til undervisningen\n - Powerpoints til undervisningen\n - Animationsfilm\n - Ekstra materiale - Plakater, logo, postkort og andet',
      'kl':
          'MANU sulisut piginnaanerannik ineriartortitsinermik toqqammaveqarpoq, taakku meeqqap atugarissaarnera peqqinneralu pillugit ilaqutariinnik ilinniartitsinissamut oqaloqateqarnissamullu piginnaasaqalertarput. \n\nMANU-minngaanneersut atortut sulisunoortut ukuupput:\n\n- llinniartitsinissamut ilitsersuut\n- Powerpoint seqersittagaq ilinniartitsinermi atorneqarsinnaasoq\n- Titartakkatut filmiliaaraq\n- Atortut allat, assilissat angisuut (plakaatit), MANUp ilisarnaataa, allakkanut allaffissaq (postkorti) allallu',
    },
    '2qw31h4a': {
      'da': 'Manu 0-9 mdr.',
      'kl': 'Manu 0-9 mdr.',
    },
    'is3qlpj6': {
      'da': 'Manu 1-2 år',
      'kl': 'Manu Ukiut 1-2',
    },
    'ajmumzt1': {
      'da': 'Manu 3-4 år',
      'kl': 'Manu Ukiut 3-4',
    },
    '9rn08t7k': {
      'da': 'Manu 5-6 år',
      'kl': 'Manu Ukiut 5-6',
    },
    '77yc693u': {
      'da': 'Manu Alkohol',
      'kl': 'Manu Imigassaq',
    },
    '0yka7x8f': {
      'da': 'Forældremødet',
      'kl': 'Angajoqqaanut Ataatsimiisitsineq',
    },
    'nmohpb9n': {
      'da': 'Manu Hash',
      'kl': 'Manu Hash',
    },
    '9su58rx7': {
      'da': 'Manu Instruktør',
      'kl': 'Manu Ilitsersuisartoq',
    },
    'r46a16dq': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Borneboger
  {
    'etozm5x2': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'd9lfzere': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'g1mauum1': {
      'da': 'Bøgerbøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'bnwcchzm': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'oixhf1zb': {
      'da': 'Manumina foldebog, Barnet første bog',
      'kl': 'Manumina atuagaaraq mappertagaq',
    },
    'j3jc1acp': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'xo0ton9o': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    's7zunhk9': {
      'da': 'Manumina starter i skole (Bog)',
      'kl': 'Manumina atualerpoq (Bog)',
    },
    'lfnb23l1': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '3oqeke7n': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'va4pi1sp': {
      'da': 'Manumina har skoldkopper (bog)',
      'kl': 'Manuminas kuppiararpoq (bog)',
    },
    '7suesv53': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'uioeh4t4': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '8xtiweth': {
      'da': 'Manuminas følelser (bog)',
      'kl': 'Manuminas misiqissusai (bog)',
    },
    'yyr6crd2': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '4iqh7aly': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'b1zqqcih': {
      'da': 'Manuminas krop (bog)',
      'kl': 'Manuminas timaa (bog)',
    },
    'nglhy3qo': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'trgdb8r8': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'gjxkqh00': {
      'da': 'Manumina leger (bog)',
      'kl': 'Manumina pinnguarpoq (bog)',
    },
    'cgiar32d': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'wlkzyi3q': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '3z2s5qzq': {
      'da': 'Manumina vasker hænder (bog)',
      'kl': 'Manuminap assani errortorpai (bog)',
    },
    'eg6x87jg': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '9ftnwgbo': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'rebegy1d': {
      'da': 'Manumina sov godt (bog)',
      'kl': 'Manuminas sinilluarit (bog)',
    },
    'bdcuky6k': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '3q2paiz4': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '66u1abxa': {
      'da': 'Kunuk flytter (Opgavehæfte)',
      'kl': 'Kunuk nuuppoq (Opgavehæfte)',
    },
    'qvtlrgrd': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'jsage7r5': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // ManuminastarteriskoleBog
  {
    'tljq75os': {
      'da': 'Manumina starter i skole',
      'kl': 'Manumina atualerpoq',
    },
    'f92r20qq': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    '4zwvykww': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'js0cumq8': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '6u6esw6z': {
      'da': 'Manumina starter i skole (Bog)',
      'kl': 'Manumina atualerpoq (bog)',
    },
    'uhzl9ioj': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '7w6gqth9': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminaharskoldkopperbog
  {
    'ps8izcmi': {
      'da': 'Manumina har skoldkopper',
      'kl': 'Manuminas kuppiararpoq',
    },
    'k00t9sy0': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'xsidcjqn': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'p4fl1yy0': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '73qdp38h': {
      'da': 'Manumina har skoldkopper (bog)',
      'kl': 'Manuminas kuppiararpoq (bog)',
    },
    'aeiruobj': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'phcbc7bf': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminasflelserbog
  {
    'crjj7r8c': {
      'da': 'Manuminas følelser',
      'kl': 'Ilisimasallit',
    },
    '4ze5p8pk': {
      'da': 'Børn',
      'kl': 'Ilisimasallit',
    },
    '0yzo1zyu': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'j9tjemwt': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'wvogdt5b': {
      'da': 'Manuminas følelser (bog)',
      'kl': 'Manuminas misiqissusai (bog)',
    },
    '51f2qj4r': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '3tmyrrky': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminaskropbog
  {
    'yelazrbz': {
      'da': 'Manuminap timaa',
      'kl': 'Ilisimasallit',
    },
    '3yf4f8bj': {
      'da': 'Meeqqanut',
      'kl': 'Ilisimasallit',
    },
    '07zbijx2': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'pxe5td9b': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '67kt47wo': {
      'da': 'Manuminas krop (bog)',
      'kl': 'Manuminas timaa (bog)',
    },
    'acepe1rf': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'bm7jzm9o': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminalegerbog
  {
    't3tuc3f9': {
      'da': 'Manumina leger',
      'kl': 'Manumina pinnguarpoq',
    },
    'fewzcglz': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'wbc3oik5': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '5kled711': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '11xyxut5': {
      'da': 'Manumina leger (bog)',
      'kl': 'Manumina pinnguarpoq (bog)',
    },
    'j6weljao': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'rh83qyji': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminavaskerhnderbog
  {
    '2j9gvk58': {
      'da': 'Manumina vasker hænder',
      'kl': 'Manuminap assani errortorpai',
    },
    'lp5u1h5g': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'ze8d8q3v': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'aem5eebw': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'rx7h8gr8': {
      'da': 'Manumina vasker hænder (bog)',
      'kl': 'Manuminap assani errortorpai (bog)',
    },
    'm9wxq05o': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'xvsqfujt': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminasovgodtbog
  {
    'tuhn3xbv': {
      'da': 'Manumina sov godt',
      'kl': 'Manumina sinilluarit',
    },
    'wc5u0dpd': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'z27cqtkm': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '6j6k5uzy': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'utfelbiq': {
      'da': 'Manumina sinilluarit (bog)',
      'kl': '',
    },
    'r06rudxt': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    'hl9gdoe8': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // KunukflytterOpgavehfte
  {
    'ptugm7wb': {
      'da': 'Kunuk flytter',
      'kl': 'Kunuk nuuppoq',
    },
    'tcz7yzxw': {
      'da': 'Børn',
      'kl': 'Ilisimasallit',
    },
    '7cza1q19': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    '6la4gxa7': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'badp2roi': {
      'da': 'Kunuk nuuppoq (Opgavehæfte)',
      'kl': '',
    },
    'lmulgdf1': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'ucohm1t3': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Hftetilforldre
  {
    '9auaqhq4': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '2l26xvy1': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'v3pvcvvh': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '75r9uixg': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'noncnq0c': {
      'da': 'Dit barn starter i skole',
      'kl': 'Qitornat atualerpoq',
    },
    '4i2cs2ex': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '4a44n9kj': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'fgjo5opq': {
      'da': 'Dit barns første bog',
      'kl': 'Meeqqavit atuaguu siulleq',
    },
    'swvkr1oo': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'en553v6y': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'ipkg28yg': {
      'da': 'Dit syge barn',
      'kl': 'Meeqqat napparsimasoq',
    },
    'evrzf9dt': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '4is5edkc': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '4lfno3w0': {
      'da': 'Dit barns følelser',
      'kl': 'Meeqqavit misigissusai',
    },
    'etrz9qzm': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'mkqohj8r': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'prflmyaw': {
      'da': 'Dit barns krop',
      'kl': 'Meeqqavit timaa',
    },
    'gyzgff8b': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'z6dwo13h': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '16c87bsz': {
      'da': 'Dit barn vasker hænder',
      'kl': 'Meeqqavit assani erortorpai',
    },
    '5ugqiiip': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'w1615a59': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'ho4dtepa': {
      'da': 'Dit barns søvn',
      'kl': 'Meeqqavit sininnissaa',
    },
    'esz78w5d': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    '9ivg97lg': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '7umiwn4g': {
      'da': 'Dit barns leg og bevægelse',
      'kl': 'Meeqqavit pinnguarnera aalaneralu',
    },
    'ck8q28j2': {
      'da': 'Læs Mere',
      'kl': 'Atuaruk',
    },
    'jwrczlqe': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnstarteriskole
  {
    '3vgjbpgy': {
      'da': 'Dit barn starter i skole',
      'kl': 'Qitornat atualerpoq',
    },
    '0fq55j4e': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'fbdyn97k': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'yzc8ijfy': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'rp9rh4wn': {
      'da': 'Dit barn starter i skole',
      'kl': 'Qitornat atualerpoq',
    },
    'qmg3cwhy': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'xavb4fkh': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnsfrstebog
  {
    'x90fsn6x': {
      'da': 'Dit barns første bog',
      'kl': 'Meeqqavit atuaguu siulleq',
    },
    'z5mhg8zl': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'pir9ek7g': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'yt6fn6nw': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'gptf98tr': {
      'da': 'Dit barns første bog',
      'kl': 'Meeqqavit atuaguu siulleq',
    },
    '66p6d3qp': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'v7zbak2b': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditsygebarn
  {
    '4h0qdjg7': {
      'da': 'Dit syge barn',
      'kl': 'Meeqqat napparsimasoq',
    },
    'ia20j9yv': {
      'da': 'Børn',
      'kl': 'Ilisimasallit',
    },
    'gf3idg3c': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'pgpl1tih': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '0fbtxvoi': {
      'da': 'Dit syge barn',
      'kl': 'Meeqqat napparsimasoq',
    },
    'gs2gm1x2': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'rdgy6c61': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnsflelser
  {
    'rdmrrj4m': {
      'da': 'Dit barns følelser',
      'kl': 'Meeqqavit misigissusai',
    },
    '2owvcem8': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'rt14qav9': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat ',
    },
    'q97sbckv': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat ',
    },
    'ya53eox4': {
      'da': 'Dit barns følelser',
      'kl': 'Meeqqavit misigissusai',
    },
    'zl0538ue': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'b6b4sj5t': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnskrop
  {
    'd96xlz07': {
      'da': 'Dit barns krop',
      'kl': 'Meeqqavit timaa',
    },
    '73omil1a': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'sfzfr10q': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '9lhad2yd': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '97eeekaj': {
      'da': 'Dit barns krop',
      'kl': 'Meeqqavit timaa',
    },
    'rhefnv2w': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'jbwe70dj': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnvaskerhnder
  {
    'nffapabz': {
      'da': 'Dit barn vasker hænder',
      'kl': 'Meeqqavit assani erortorpai',
    },
    'z4mojber': {
      'da': 'Børn',
      'kl': 'Ilisimasallit',
    },
    'loh63hsl': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'xwntyb5h': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'rgl941n1': {
      'da': 'Dit barn vasker hænder',
      'kl': 'Meeqqavit assani erortorpai',
    },
    't9op74ut': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'gubundtg': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnssvn
  {
    'o275i4hn': {
      'da': 'Dit barns søvn',
      'kl': 'Meeqqavit sininnissaa',
    },
    '2lel71hp': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'zvr0m5rg': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '1gey4cu0': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    '3qrm0p2w': {
      'da': 'Dit barns søvn',
      'kl': 'Meeqqavit sininnissaa',
    },
    '9ijw2qpz': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'vslbh87g': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnslegogbevgelse
  {
    '08nbab14': {
      'da': 'Dit barns leg og bevægelse',
      'kl': 'Meeqqavit pinnguarnera aalaneralu',
    },
    'objqiks6': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'lrvz9weh': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'fgktlzi2': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut kakkersakkat',
    },
    'p1l759la': {
      'da': 'Dit barns leg og bevægelse',
      'kl': 'Meeqqavit pinnguarnera aalaneralu',
    },
    'qnojnkkl': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'ruhfmmb3': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Plakat
  {
    '8wyoj5g4': {
      'da': 'Plakat',
      'kl': 'Ilisimasallit',
    },
    'agpbofzb': {
      'da': 'Børn',
      'kl': 'Meeqqanut',
    },
    'zx6k8w40': {
      'da': 'Plakaati',
      'kl': 'Ilisimasallit',
    },
    'u0a7udoc': {
      'da': 'Plakaati',
      'kl': '',
    },
    'e6mmarxd': {
      'da': 'MANU børn plakat',
      'kl': '',
    },
    '9axg22na': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'ct04dysk': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Downloads
  {
    'hk62ao45': {
      'da': 'Downloads',
      'kl': 'Aanikuusat',
    },
    'bgl6li55': {
      'da': 'Downloads',
      'kl': 'Aanikuusat',
    },
    'k5kcu6u2': {
      'da': 'Videoer',
      'kl': 'Aalasuliat',
    },
    'vr6cq0fk': {
      'da': 'Lydbøger',
      'kl': 'Atuakkat Immiussat',
    },
    'e02q0yrd': {
      'da': 'Dokumenter',
      'kl': 'Dokumentit',
    },
    'e51lkf75': {
      'da': 'Åben fil',
      'kl': '',
    },
    'a9v0umsj': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F0-9
  {
    'p9gqdzr3': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    'urfdx21z': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'o6dp1m9a': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    'as99qqby': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'nqd98ql3': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'mguh9275': {
      'da': 'Powerpoints',
      'kl': 'Powerpoints',
    },
    'm2k18g27': {
      'da': 'Plakat, logo, postkort mm.',
      'kl': 'Plakat, logo, postkort mm.',
    },
    'llzhl9wu': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4
  {
    '5ce1vet0': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    'hvwcxqx8': {
      'da': 'Falgfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'tpysyri4': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    'lcqc9xhx': {
      'da':
          'Formålet med MANU Barnet 3 og 4 år er at styrke forældreskabet og forældreansvaret til gavn for børnene. Det sker ved at:\n\n- Forældrene bliver opmærksomme på, hvad barnet er optaget af, og hvordan det påvirker dem som forældre.\n\n- Barn og forældre indgår i fælles hverdagsaktiviteter til glæde for begge\nparter, og forældre lærer, hvordan de kan bidrage til barnets leg.\n\n- Forældrene taler med og tager initiativer sammen med barnet.\n\n- Forældrene oplever, at det ok at tale om det, som er svært, og at sætte ord på egne følelser.\n\n- Styrke dialogen mellem forældrene.\n\nDet er sjovt at have et barn på 3-4 år. Udviklingen går hurtigt, og dit barn overrasker dig sikkert med uventede spørgsmål og ting, du ikke lige havde forestillet dig, dit barn går rundt og funderer over. Samtidig er der meget, et barn i den alder endnu ikke kan, fx styre sit temperament, når det bliver vredt eller ked af det eller ikke helt forstår, fx hvorfor det skal i seng om sommeren, når det er så dejligt at lege udenfor..',
      'kl':
          'Meeqqat 3-nik aamma 4-nik ukiullit pillugit ilisimasat:\n\n- Meeqqat takusatik misigisatillu eqqarsaqqaaratik tassanngaannarlu qisuariarfigisarpaat.\n\n- Meeqqat taama ukiullit arlalitsigut sakkortuunik misigissuseqartarput. Meeqqannut iluaqutaassaaq, misigissutsit meeqqami takusinnaasatit pillugit oqaloqatigisarukku.\n\n- Meeqqat piffissap malinnaaviginissaa ajornakusoortinnerusaqaat. Imaappoq meeqqap ataatap angerlamut apuunnissaa sivisoorujussuartut misigisinnaavaa, naak uagutsinnut inersimasunut akunneq ataasiinnaagaluartoq.\n\n- Meeqqat inersimasoq qimakkuminaatsissinnaasarpaat. Anaanap ataatalluunniit qimagutilernerat toqqissiunnaarutaasinnaavoq. Taamaammat immaqa meeqqap noqissavaatit qimaqqunanilu. Meeqqat allat allamukarnissaq nuannarisaqaat, inuulluaqqunissallu piffissaqarfigsarnagulluunniit.\n\n- Meeqqap inuup allap qanoq-innera sunillu piumasaqarnera arlalitsigut takorloorsinnaalersarpaa. Ilutigisaanillu meeraq tassangaannartunik iliuuseqarsinnaasarluni.',
    },
    'su0gxqtc': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'mcmkotu0': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'mku6p5qb': {
      'da': 'Powerpoints',
      'kl': 'Powerpoints',
    },
    'o8bytjmn': {
      'da': 'Plakater, logo, post mm',
      'kl': 'Plakater, logo, post mm',
    },
    'y4x575uh': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F5-6
  {
    'lkyyjcnk': {
      'da': 'MANU 5-6 År',
      'kl': 'Angajoqqaanut',
    },
    '33ni89ag': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'ktso7cel': {
      'da': 'MANU 5-6 år',
      'kl': 'MANU Ukiut 5-6',
    },
    '3p3df8ja': {
      'da': 'Materiale',
      'kl': 'Atortussiat',
    },
    'r6jw9vq0': {
      'da': 'Animationsfilm',
      'kl': 'Aalasuliat',
    },
    'a0pvf19z': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F-Alkohol
  {
    'oqbio084': {
      'da': 'MANU Alkohol',
      'kl': 'MANU Imigassaq',
    },
    'py7k2mti': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '49ei58cq': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    'd90jbxvx': {
      'da':
          'Alkohol er et udbredt rusmiddel. Men én gruppe er særligt følsom over for alkoholens skadelige virkninger, nemlig børn. Det gælder både ufødte børn i livmoderen og børn der vokser op med et skadeligt forbrug af alkohol i den nærmeste familie.\n\nBørn har brug for trygge rammer hos forældre, som kan give den nødvendige omsorg og kærlighed. Desværre har mange børn i dag ikke den trygge opvækst, de burde have. Flere undersøgelser og rapporter viser, at skadeligt forbrug af alkohol er årsag til en meget stor del af de problemer, som børn, unge og familier har. Politiets rapporter beskriver, at alkohol ofte er involveret i sager om vold, ulykker og selvmord.\n\nDet kræver dialog, indføling og omsorg at samarbejde med forældre, som har et skadeligt alkoholforbrug. De forældre har ofte mange forskellige ting at slås med i deres liv. Det betyder meget for forældrene, at vi støtter i forhold til de udfordringer, som de møder. Forældrene skal have mulighed for at få den bedste begyndelse med et nyt barn i familien.',
      'kl':
          'Imigassaq aangajaarniutaavoq atugaaqisoq. Kisianni imigassap ajoqutaasumik kingunerisartagaanik sunnigaanerpaasartut tassaapput meeqqat. Tamannalu meeqqanut suli ilumiuusunut aamma meeqqanut ajoqusiisartumik imigassamik atuisunik qaninnerpaasaminnik ilaqutaqarlutik peroriartortunut atuuppoq. \n\nMeeqqat angajoqqaaminni toqqissisimasunik avatangiiseqarlutik pisariaqartumik isumassorneqarlutik asaneqarlutillu peroriartornissartik pisariaqartippaat. Ajoraluartumik ullumikkut meeqqat amerlasuut taama pisariaqartitaminnik toqqissimasumik peroriartortanngillat. Misissuinerit nalunaarusiallu arlallit takutippaat, ajoqusiissutaasumik imigassamik atuineq meeqqat ilaqutariillu ajornartorsiutaasa ilarpassuinut pissutaasoq. \n\nPolitiit nalunaarutaasa takutippaat, imigassaq persuttaanerit, ajunaarnerit imminornerillu pillugit suliani akuukulaqisoq. Angajoqqaanik, ajoqusiisartumik imigassamik atueriaasilinnik suleqateqarnermi piumasaavoq oqaloqatigiinnissaq, misiginneqataasinnaaneq isumassuinerlu. \n\nAngajoqqaat taakku inuunerminni arlalitsigut assigiinngitsorpassuarnik ajornartorsiuteqartarput. Angajoqqaanut pingaartorujussuuvoq ilissinniit tapersersorneqarnissaq, unamminartunut naapittagaannut naleqqiullugu. \n\nAngajoqqaat ilaqutariinni meeraq nutaaq peqatigalugu pitsaanerpaamik aallarteriarnissaminnut periarfissaqartariaqarput\nIllit, meeqqat angajoqqaajunerillu MANU alkohol aqqutigalugu aallartilluarnissamut periarfissikkumavatsigit.',
    },
    'l0zbufnx': {
      'da': 'MANU Alkohol',
      'kl': 'Angajoqqaanut',
    },
    'm62ufaoz': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    '8h0dn1rp': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    '5rz298k0': {
      'da': 'Hæfter',
      'kl': 'Mappersakkat',
    },
    'wq7unn0y': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F-Hash
  {
    'wtjox8m9': {
      'da': 'MANU Hash',
      'kl': 'MANU Hash',
    },
    'dxjv50kv': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'hkjua5fq': {
      'da': 'MANU Hash',
      'kl': 'MANU Hash',
    },
    'zy23vxez': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'utgyzr58': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    'sduc9io2': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
    },
    'zl0tmklp': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F-Instruktr
  {
    'ofp92jij': {
      'da': 'MANU Instruktør',
      'kl': 'MANU Ilitsersuisoq',
    },
    'mj3qurqe': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'iqdkoyya': {
      'da': 'MANU Instruktør',
      'kl': 'MANU Ilitsersuisoq',
    },
    '23vvs7we': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'fizh4lgf': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'slxfwnqw': {
      'da': 'Ekstra materiale',
      'kl': 'Atortussat allat',
    },
    'ha1wzk06': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F-Foreldremodet
  {
    'pho93uxv': {
      'da': 'MANU Forældremødet',
      'kl': 'MANU Angajoqqaanik ataatsimiisitsineq',
    },
    'wgp3ivfj': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'p3acnnmq': {
      'da': 'MANU Forældremødet',
      'kl': 'MANU Angajoqqaanik ataatsimiisitsineq',
    },
    'nfj0wj0p': {
      'da':
          'MANU Forældremøde er et supplement til de øvrige tilbud til gravide familier og\nfamilier med småbørn.\n\nMANU forældremøde indeholder tre temaer, som kan bruges, når der skal holdes\nforældremøde i børnehaven.\n\nDe tre temaer, som er beregnet til hvert et møde, handler om:\n\n1. Barnets behov\n2. Børneopdragelse\n3. Fællesskab og samarbejde\n\nFormålet med forældremødet er at:\n\n- Formidle viden om børnehavebarnets behov\n- Forældrene bliver bevidst om børnenes behov\n- Styrke forældrenes muligheder for at kunne varetage sit barns behov\n- Styrke åbenhed og fællesskab blandt forældrene og personalet\n',
      'kl':
          'MANU Forældremøde er et supplement til de øvrige tilbud til gravide familier og\nfamilier med småbørn.\n\nMANU forældremøde indeholder tre temaer, som kan bruges, når der skal holdes\nforældremøde i børnehaven.\n\nDe tre temaer, som er beregnet til hvert et møde, handler om:\n\n1. Barnets behov\n2. Børneopdragelse\n3. Fællesskab og samarbejde\n\nFormålet med forældremødet er at:\n\n- Formidle viden om børnehavebarnets behov\n- Forældrene bliver bevidst om børnenes behov\n- Styrke forældrenes muligheder for at kunne varetage sit barns behov\n- Styrke åbenhed og fællesskab blandt forældrene og personalet\n',
    },
    '4c6rhsot': {
      'da': 'Vidste du?',
      'kl': 'Nalunngiliuk?',
    },
    'vbp1rutu': {
      'da':
          'Vidste du, at de fleste gravide familier har mere lyst til at skabe ændringer i deres liv end ikke gravide?\n\nØnsker du eller din kæreste en sundere livsstil?\n\nSå er graviditeten en enestående mulighed for at lykkedes med at ændre usunde vaner til sunde.',
      'kl':
          'Vidste du, at de fleste gravide familier har mere lyst til at skabe ændringer i deres liv end ikke gravide?\n\nØnsker du eller din kæreste en sundere livsstil?\n\nSå er graviditeten en enestående mulighed for at lykkedes med at ændre usunde vaner til sunde.',
    },
    '90us2mhu': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    '3etmkfcm': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    '45k0tqyg': {
      'da': 'Powerpoints',
      'kl': 'Ilitsersuinermut',
    },
    '0slrkos3': {
      'da': 'Plakater, logo, post mm',
      'kl': 'Ilitsersuinermut',
    },
    '0ea5x1ji': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Frundervisningen
  {
    '6pzqb6u1': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    '34nng204': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '5zztdyr0': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    '5rql8wcy': {
      'da':
          'Undervisningsvejledning til forældreforberedelse 0-9 mrd. til fagpersonale/MANU underviser',
      'kl': 'llinniartitsinissamut ilitsersuut',
    },
    'nltevt7n': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'gnvie2p8': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Tilundervisningen
  {
    'ty5xwr4d': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    '62tfuh3m': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'cfe1syxw': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    'd1l76z6k': {
      'da': 'MANU 0-9 måneder',
      'kl': 'MANU Qaammatit 0-9',
    },
    'k4vjlz9q': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '4eeahl1a': {
      'da': 'Angaoqqaanngornissamut piareersarneq, forældreforberedelse',
      'kl': 'Angaoqqaanngornissamut piareersarneq, forældreforberedelse',
    },
    '6bkaap63': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'jxcnpjta': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'k3fopprx': {
      'da':
          'Pilluarit, Angajoqqaanngulerputit, \nTillykke du skal være forælder',
      'kl':
          'Pilluarit, Angajoqqaanngulerputit, \nTillykke du skal være forælder',
    },
    '7agqlvy2': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'lmvunpxs': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '02x86j72': {
      'da': 'Angajoqqaanngornissamut piareersarneq, Forældreforberedelse',
      'kl': 'Angajoqqaanngornissamut piareersarneq, Forældreforberedelse',
    },
    'vgg9pyb0': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'vk0ilprn': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'lfxjwj3w': {
      'da': 'Angajoqqanngornissamut piareersarneq, forældreforberedelse',
      'kl': 'Angajoqqanngornissamut piareersarneq, forældreforberedelse',
    },
    'a6n7ojm8': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'vd0v5hmv': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Powerpoints
  {
    'x2g73iuz': {
      'da': 'Powerpoints',
      'kl': 'Angajoqqaanut',
    },
    'tglu18pp': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'x1ocohjg': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    'n03tfqol': {
      'da': 'Powerpoints (Kalaallisut)',
      'kl': 'Powerpoints (Kalaallisut)',
    },
    'g1zdkoch': {
      'da': '1 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '1 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    '5kbbvpl9': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'rgab7ue7': {
      'da': '2 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '2 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'fpnl5pzn': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'kkporxui': {
      'da': '3 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '3 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    '46byp7l6': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'lthq60di': {
      'da': '4 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '4 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'kvttco4y': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '3n2qkzzr': {
      'da': '5 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '5 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    '52akb4ct': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'nnqwj4m9': {
      'da': '6 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '6 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'jt7i0w6a': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'c38cs5xu': {
      'da': '7 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '7 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'fub6cah6': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'k9ijsmop': {
      'da': '8 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '8 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'ufoes9bw': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '6dnb1jvy': {
      'da': '9 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
      'kl': '9 Ilinniartitsineq Meeraq naartuneq angajoqqaajunerlu',
    },
    'k4qixdkc': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'm5yw5b1q': {
      'da': 'Powerpoints (Dansk)',
      'kl': 'Powerpoints (Qallunaatut)',
    },
    '0m41n8xz': {
      'da': '1 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '1 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    's4ielgdr': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '9tjoz2ov': {
      'da': '2 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '2 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    '2fn2skmi': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    's95duj7i': {
      'da': '3 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '3 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    '2h95h2rw': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'wz8eo43b': {
      'da': '4 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '4 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'f0arwkds': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'qos6his9': {
      'da': '5 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '5 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'ic0r5sip': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'g45djwya': {
      'da': '6 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '6 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'xyucda7y': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'geo60eew': {
      'da': '7 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '7 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'ttbxx3oc': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '4x90jb8t': {
      'da': '8 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '8 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'z4auf509': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'v6dmmqcx': {
      'da': '9 Til undervisning forældreforberedelse \n0-9 måneder',
      'kl': '9 Til undervisning forældreforberedelse \n0-9 måneder',
    },
    'pge10el4': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'k97lk190': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Plakatlogopostkortmm
  {
    'mm9cbj01': {
      'da': 'Plakat, logo, postkort mm.',
      'kl': 'Angajoqqaanut',
    },
    'zw3und1k': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '53dgai65': {
      'da': 'MANU 0-9 mnd',
      'kl': 'MANU Qaammatit 0-9',
    },
    'wdun9c08': {
      'da': 'Forældreforberedelse 0-9 måneder Logo',
      'kl': '',
    },
    '08pd0hu2': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '52t11d5y': {
      'da': 'Plakat ”venter du barn”\n forældreforberedelse',
      'kl': 'Plakati “Meerartaalerpit” angajoqqaanngornissamut piareersarneq',
    },
    '17qa28jm': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '1t1954pb': {
      'da': 'Postkort ”venter du barn” forældreforberedelse',
      'kl': 'Postkort “Meerartaalerpit” angajoqqaanngornissamut piareersarneq',
    },
    '121qtufm': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'red3q2lk': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F1-2
  {
    'bqfrqsoe': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    'msorg8b6': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'cqjyhfnf': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    '5flhcqem': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    '35dvrnaw': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'ug9tm2pl': {
      'da': 'Powerpoints',
      'kl': 'Powerpoints',
    },
    'o2ba2tpe': {
      'da': 'Stickers',
      'kl': 'Stickers',
    },
    '55o3c6qd': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F1-2_Powerpoints
  {
    's6nnkvvv': {
      'da': 'Powerpoints',
      'kl': 'Powerpoints',
    },
    'anrvad27': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'juvc96m0': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    'rpgz31ls': {
      'da': 'Powerpoints (Kalaallisut)',
      'kl': 'Powerpoints (Kalaallisut)',
    },
    'a1abvam8': {
      'da': '1 Ilinniartitsineq  MANU 1-2 år',
      'kl': '1 Ilinniartitsineq  MANU 1-2 år',
    },
    'yjs6dts1': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'o70kokwm': {
      'da': '2 Ilinniartitsineq  MANU 1-2 år',
      'kl': '2 Ilinniartitsineq  MANU 1-2 år',
    },
    'l0c4n1ic': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'cofkv71a': {
      'da': 'Powerpoints (Dansk)',
      'kl': 'Powerpoints (Qallunaatut)',
    },
    'hk32qizz': {
      'da': '1 til undervisning MANU 1-2 år',
      'kl': '1 til undervisning MANU 1-2 år',
    },
    'jpqfnnw9': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'wkg30hzx': {
      'da': '2 til undervisning MANU 1-2 år',
      'kl': '1 til undervisning MANU 1-2 år',
    },
    '2icynn74': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'l25yofoh': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F1-2_Frundervisningen
  {
    'obbhi8r8': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'p4g8ohi9': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'h3ve64l8': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    'ffgldyph': {
      'da': 'MANU Barnet på 1 og 2 år – Underviservejledning',
      'kl':
          'MANU Meeraq 1-nik aamma 2-nik ukiulik – Ilinniartitsinissamut ilitsersuut',
    },
    'chnu7mlm': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'qk0yu4a0': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F1-2_Tilundervisningen
  {
    '460ow158': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    '9zshii97': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '7fb8o0ir': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    'xmz6w6lf': {
      'da': 'MANU 1-2 år',
      'kl': 'MANU Ukiut 1-2',
    },
    'e6882dli': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'z0utyvs0': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
    },
    '89uz5x5y': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'f8pszrf1': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '1yodbe8e': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
    },
    'xbpkw85l': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '3yz855uy': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4_Frundervisningen
  {
    '55er0w1s': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'tjwchn0d': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'dkofrw4h': {
      'da': 'MANU Ukiut 3-4',
      'kl': 'Angajoqqaanut',
    },
    'dr164v2q': {
      'da': 'MANU Barnet på 1 og 2 år – Underviservejledning',
      'kl':
          'MANU Meeraq 3-nik aamma 4-nik ukiulik – Ilinniartitsinissamut ilitsersuut',
    },
    'w2aydbrm': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'r2t44ue3': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4_Powerpoints
  {
    'm9ptaulg': {
      'da': 'Powerpoints',
      'kl': 'Angajoqqaanut',
    },
    'ne7icfux': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '340lzmgs': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    'nd28o7lw': {
      'da': '1 Ilinniartitsineq MANU 3-4 år',
      'kl': '1 Ilinniartitsineq MANU 3-4 år',
    },
    'xwvu6uvl': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '5m3n51q5': {
      'da': '2 Ilinniartitsineq MANU 3-4 år',
      'kl': '2 Ilinniartitsineq MANU 3-4 år',
    },
    'i1ahmzni': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'rpwhid1n': {
      'da': '3 Ilinniartitsineq MANU 3-4 år',
      'kl': '3 Ilinniartitsineq MANU 3-4 år',
    },
    '39rttr5f': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'p2fuhpum': {
      'da': '4 Ilinniartitsineq MANU 3-4 år',
      'kl': '4 Ilinniartitsineq MANU 3-4 år',
    },
    'eutvuki0': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '0atldetc': {
      'da': '5 Ilinniartitsineq MANU 3-4 år',
      'kl': '5 Ilinniartitsineq MANU 3-4 år',
    },
    'k6vo01vi': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'va8ngpo2': {
      'da': 'Powerpoints (Dansk)',
      'kl': 'Powerpoints (Qallunaatut)',
    },
    'jdzkdwr2': {
      'da': '1 til undervisning  MANU 3-4 år',
      'kl': '1 til undervisning  MANU 3-4 år',
    },
    'jgfhnwvz': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'mes2ffo1': {
      'da': '2 til undervisning MANU 3-4 år',
      'kl': '2 til undervisning MANU 3-4 år',
    },
    '4htcuzzq': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '0clppgyl': {
      'da': '3 til undervisning  MANU 3-4 år',
      'kl': '3 til undervisning  MANU 3-4 år',
    },
    '2u8uclpn': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'ta2bpnlk': {
      'da': '4 til undervisning MANU 3-4 år',
      'kl': '4 til undervisning MANU 3-4 år',
    },
    'lc8klwmo': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'g8iqpifs': {
      'da': '5 til undervisning MANU 3-4 år',
      'kl': '5 til undervisning MANU 3-4 år',
    },
    'ipr8mghb': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'ue89w29s': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4_Tilundervisningen
  {
    'j41r1r2z': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'x0t8v2eo': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'jyupqwz3': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    '71cphewl': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    'gfr3us9l': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'xlo1bu5x': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'g8qs0bc1': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'km1s0zem': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'r3le0idd': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    '811e27fq': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '9x4xo9jz': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'x1y2w11j': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'ln779a8j': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'kqv8klk3': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '7k64vke3': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
    },
    'r1kf8we3': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'sq4k7e6v': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'wlzc2z0n': {
      'da': '(3-4 år) Animationsfilm - \nGoddag og farvel',
      'kl': '(3-4 år) Animationsfilm - \nGoddag og farvel',
    },
    '0ho5txnp': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'xmwrujr8': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4_Plakatlogopostkortmm
  {
    '44b7ftak': {
      'da': 'Plakat, logo, postkort mm.',
      'kl': 'Angajoqqaanut',
    },
    'awihxqfi': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    's5la35wt': {
      'da': 'MANU 3-4 år',
      'kl': 'MANU Ukiut 3-4',
    },
    'kz6v2y5q': {
      'da': 'MANU 3-4 år Invitation',
      'kl': 'MANU 3-4 år Qaaqqusissut',
    },
    '0usttrju': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '6x21st3m': {
      'da': 'MANU 3-4 år Plakat',
      'kl': 'MANU 3-4 år Plakaati',
    },
    'dzfrlxm6': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'oo3baql7': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F5-6_Tilundervisningen
  {
    'fs7nx9t3': {
      'da': 'Animationsfilm',
      'kl': 'Titartakkanik aalasuliat',
    },
    'hsde1s4v': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '260od85r': {
      'da': 'MANU 5-6 år',
      'kl': 'MANU Ukiut 5-6',
    },
    '7sam2ks0': {
      'da': 'MANU 5-6 år',
      'kl': 'MANU Ukiut 5-6',
    },
    'n0ej0a1t': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    '3yb52lgy': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
    },
    '2rcc5h4o': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '350wrrvz': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'xtsz0fut': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
    },
    '4it0hwto': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    '2cz5r71k': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F5-6_Materialer
  {
    '42uhnaap': {
      'da': 'Materialer',
      'kl': 'Atortussiat',
    },
    'bor3jq71': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'v40hw7tu': {
      'da': 'MANU 5-6 år',
      'kl': 'MANU Ukiut 5-6',
    },
    'txwhib6y': {
      'da': 'MANU samtaleark 5-6 år',
      'kl': 'MANU oqaloqatigiinnerit 5-6-inik ukiullit',
    },
    '9mnc29h5': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'cyf2er68': {
      'da': 'Samtalevejledning 5-6 år',
      'kl': 'Oqaloqatiginninneq 5-6-inik ukiulik',
    },
    'n3q4zpub': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'h9c3i25o': {
      'da':
          'Vejledning til ledere og pædagogisk personale, Barnet på 5 og 6 år',
      'kl':
          'Qqutsisunut peorsaanermillu suliaqartunut ilitsersuut, \nMeeraq tallimanik arfinilinnillu ukiulik',
    },
    'vkwy4f7d': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'qllxm34o': {
      'da': 'MANU 5-6 år Plakat',
      'kl': 'MANU 5-6-inik ukiulik Plakaati',
    },
    '3kv5iytb': {
      'da': 'Download PDF',
      'kl': 'ANGAJOQQAANUT',
    },
    '1n57io9h': {
      'da': 'MANU spilleregler 5-6 år',
      'kl': 'MANU Pinnguaat (malittarisassat)  5-6',
    },
    'xjvau9sw': {
      'da': 'Download PDF',
      'kl': 'ANGAJOQQAANUT',
    },
    'df6ggfzs': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Alkohol_Frundervisningen
  {
    'waes7ecs': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'wvnko8j8': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'o51v3wmx': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    'ditnnsn5': {
      'da': 'MANU samtalevejledning om alkohol',
      'kl': 'MANU imigassaq pillugu oqaloqatigiinnissamut ilitsersuut',
    },
    'sv7t0ef3': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'w78mw9wo': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_alkohol_Tilundervisningen
  {
    '3ylw8u1w': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'wbjapu3b': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '6t0cyxhj': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    'bct6lqf2': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    '28z92xs8': {
      'da': 'MANU',
      'kl': 'MANU',
    },
    'a7avmelp': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    'alacq0hz': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'd16bf7fq': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Alkohol_haefter
  {
    '2l8yx6dx': {
      'da': 'Hæfter',
      'kl': 'Mappersakkat',
    },
    'zkpo1wpu': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '87jf8l1s': {
      'da': 'Alkohol',
      'kl': 'Imigassaq',
    },
    'qodi48hf': {
      'da':
          'MANU information til fagpersoner om \nalkohol og graviditet, amning og forældreskab.',
      'kl':
          'MANU imigassaq naartunerlu, milutsitsineq angajoqqaajunerlu pillugit sulisunut paasissutissiissutit',
    },
    'wui0aqt0': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'w0t79y03': {
      'da':
          'MANU information om alkohol til forældre – graviditet, amning og den nye familie',
      'kl':
          'MANU imigassaq pillugu angajoqqaanut paasissutissat – naartuneq, milutsitsineq ilaqutariinngorlaallu',
    },
    'gb2i49ep': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'v2o8qlm7': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Foreldremodet_Frundervisningen
  {
    'ggjn0izv': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'u8dboi74': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '5llpuq7g': {
      'da': 'Forældremødet',
      'kl': 'Angajoqqaanik ataatsimiisitsineq',
    },
    'leapv5vr': {
      'da': 'MANU Forældremøde 0-2 år \nVejledning',
      'kl':
          'MANU 0-imiit 2-nut ukiulinnut \nangajoqqaanik ataatsimiisitsineq – Ilitsersuut',
    },
    'rtiuiqdl': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'sk2wu3uv': {
      'da': 'MANU Forældremøde \nVejledning, 3-6 år',
      'kl': 'MANU Angajoqqaanik ataatsimiisitsineq, \nIlitsersuut, 3-6-inik',
    },
    'p8dkxr62': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '6wk7f1yo': {
      'da':
          'Vejledning til ledere og pædagogisk personale, Barnet på 5 og 6 år',
      'kl':
          'Aqutsisunut perorsaanermillu suliaqartunut ilitsersuut, \nMeeraq tallimanik arfinilinnillu ukiulik',
    },
    'c6pz9xwi': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'vvbd3gsy': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Foreldremodet_Tilundervisningen
  {
    'b9yxkc1a': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'hohxjnva': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'jb3g4vgc': {
      'da': 'Forældremødet',
      'kl': 'Angajoqqaanik ataatsimiisitsineq',
    },
    'ndazsna7': {
      'da': 'Animationsfilm',
      'kl': 'Titartakkanik aalasuliat',
    },
    '2miovdfm': {
      'da': 'MANU',
      'kl': '',
    },
    'edwac4cc': {
      'da': 'Animationsfilm forældremøde',
      'kl': 'Titartakkanik aalasuliaq \nAngajoqqaanik ataatsimiisitsineq',
    },
    'rske6kqx': {
      'da': 'Hent Video',
      'kl': 'ANGAJOQQAANUT',
    },
    'ibcw8y9b': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Foreldremodet_Powerpoints
  {
    'qwup2v5p': {
      'da': 'Powerpoints',
      'kl': 'Powerpoints',
    },
    'g5ekwix1': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'ujph5rsw': {
      'da': 'Forældremødet',
      'kl': 'Angajoqqaanik ataatsimiisitsineq',
    },
    'wzlyglif': {
      'da': '1 Ilinniartitsineq Meeqqavit pinnguaqatiginera MANU 0-2 år',
      'kl': '1 Ilinniartitsineq Meeqqavit pinnguaqatiginera MANU 0-2 år',
    },
    'd33gaffu': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'fz9xx7k3': {
      'da': '2 Ilinniartitsineq Meeqqap \npissariaqartitai MANU 3-6 år',
      'kl': '2 Ilinniartitsineq Meeqqap \npissariaqartitai MANU 3-6 år',
    },
    'fimmyqgd': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'fp4w1245': {
      'da': '3 Ilinniartitsineq Perorsaaneq\nMANU 3-6 år',
      'kl': '3 Ilinniartitsineq Perorsaaneq\nMANU 3-6 år',
    },
    'unhwggew': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '67s7wy52': {
      'da': '4 Ilinniartitsineq Ataatsimooqatigiinneq\nMANU 3-6 år',
      'kl': '4 Ilinniartitsineq Ataatsimooqatigiinneq\nMANU 3-6 år',
    },
    'bhyll8ub': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '2zoterm7': {
      'da': 'Powerpoints (Dansk)',
      'kl': 'Powerpoints (Qallunaatut)',
    },
    'maep4qyq': {
      'da': '1 Til undervisning Leg med dit barn\nMANU 0-2 år',
      'kl': '1 Til undervisning Leg med dit barn\nMANU 0-2 år',
    },
    'gw50sliq': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'irqc8e4v': {
      'da': '2 Til undervisning Om barnets behov\nMANU 3-6 år',
      'kl': '2.Til undervisning Om barnets behov\nMANU 3-6 år',
    },
    'kx7imqcn': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    'afvsp34r': {
      'da': '3 Til undervisning Om opdragelse \nMANU 3-6 år',
      'kl': '3 Til undervisning Om opdragelse \nMANU 3-6 år',
    },
    '6mthg5ur': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '5o2xmlhn': {
      'da': '4 Til undervisning Om fællesskab og samarbejde MANU 3-6 år',
      'kl': '4 Til undervisning Om fællesskab og samarbejde MANU 3-6 år',
    },
    'x9zg63l3': {
      'da': 'Hent Powerpoint',
      'kl': 'Powerpoint Aajuk',
    },
    '9972jloi': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Foreldremodet_Plakatlogopostkortmm
  {
    'p0ckclb4': {
      'da': 'Plakat, logo, postkort mm.',
      'kl': 'Angajoqqaanut',
    },
    'fxhkgok0': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'du4kclve': {
      'da': 'Forældremødet',
      'kl': 'Angajoqqaanik ataatsimiisitsineq',
    },
    '3blf6cks': {
      'da': 'MANU forældremøde Invitation',
      'kl': 'MANU Angajoqqaanik\nataatsimiisitsinermut qaaqqusineq',
    },
    '7y5dbwyh': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    '1xkef9pz': {
      'da': 'MANU 3-4 år Plakat',
      'kl':
          'Plakati, angajoqqaanik ataatsimiitsisinermut peqataagit, “Meeqqat siunissaraagut”',
    },
    'vvfp9kvo': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'ia43pju9': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Hash_Frundervisningen
  {
    '8yyot7rm': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'rtkyfwue': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'h9k9jams': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    'a902fuhg': {
      'da': 'MANU hash \nSamtalevejledning',
      'kl': 'MANU Hash\nOqaloqatigiinnissamut ilitsersuut',
    },
    'vdxukrgl': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'br4qn4vt': {
      'da': 'MANU Hash\nInformation til fagpersoner',
      'kl': 'MANU Hash\nSulisunut paasissutissat',
    },
    'botmc6no': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'wu19yj0d': {
      'da': 'MANU Hash \nInformation til forældre, Pjece',
      'kl': 'MANU Hash\nAngajoqqaanut paasissutissat',
    },
    'lcgww72p': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'i7a1ds5t': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Hash_Tilundervisningen
  {
    'dkfyv7d1': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    '35ku1zsq': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'tr7cvl1j': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    'gasfmbwb': {
      'da': 'Animationsfilm',
      'kl': 'Titartakkanik aalasuliat',
    },
    'mzpqsizu': {
      'da': 'MANU',
      'kl': '',
    },
    '8x267a9a': {
      'da': 'Hash',
      'kl': '',
    },
    '9azycdwt': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'g1qknbo4': {
      'da': 'MANU',
      'kl': '',
    },
    'k4jxn0kj': {
      'da': 'Hash',
      'kl': '',
    },
    'lp31zqnf': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'n8x0wezh': {
      'da': 'MANU',
      'kl': '',
    },
    'vmq0vkxi': {
      'da': 'Hash',
      'kl': '',
    },
    '364n5a0p': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'f2fpjyk9': {
      'da': 'MANU',
      'kl': '',
    },
    'kupxa56g': {
      'da': 'Hash Spot',
      'kl': '',
    },
    'mkzhb057': {
      'da': 'Hent Video',
      'kl': 'Aalasuliaq Aajuk',
    },
    'w7n54ezh': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Hash_Materialer
  {
    'dvbgu37m': {
      'da': 'Ekstra materiale',
      'kl': 'Atortussat allat',
    },
    'ewwmp9b3': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'pml35sd5': {
      'da': 'Hash',
      'kl': 'Hash',
    },
    '5963k7b8': {
      'da': 'Vejledning til rygsæk\nMANU Hash',
      'kl': 'Vejledning til rygsæk\nMANU Hash',
    },
    'b37w3srw': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'lew1jlw2': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Instruktor_Frundervisningen
  {
    '9hg97s8w': {
      'da': 'Før undervisningen',
      'kl': 'Ilitsersuineq sioqqullugu',
    },
    'wt6lkvt1': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'tndzaena': {
      'da': 'Instruktør',
      'kl': 'Ilitsersuisoq',
    },
    'cnuywejv': {
      'da': 'Grundbog for MANU instruktør',
      'kl': '',
    },
    'pt386m48': {
      'da': 'Grundbog for MANU\nInstruktører',
      'kl': '',
    },
    '7ajzk3vs': {
      'da': 'Download PDF',
      'kl': 'ANGAJOQQAANUT',
    },
    'objnsn9z': {
      'da': 'Powerpoints (Kalaallisut)',
      'kl': '',
    },
    'i08sk8n8': {
      'da': 'Ilinniartitsineq dag 1',
      'kl': '',
    },
    '7do5srqd': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'r7srty5b': {
      'da': 'Ilinniartitsineq dag 2',
      'kl': '',
    },
    '3kygesut': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'uyumv3p8': {
      'da': 'Ilinniartitsineq dag 3',
      'kl': '',
    },
    '9odhplks': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'rvjragii': {
      'da': 'Ilinniartitsineq hash og alkohol',
      'kl': '',
    },
    'a8qvrap8': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    '1qbiu8ek': {
      'da': 'Powerpoints (Dansk)',
      'kl': '',
    },
    'sgtoj213': {
      'da': 'Til undervisning dag 1',
      'kl': '',
    },
    '4xb0o8q1': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'nmgmnqsu': {
      'da': 'Til undervisning dag 2',
      'kl': '',
    },
    'otj0l36n': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'co01ltk5': {
      'da': 'Til undervisning dag 3',
      'kl': '',
    },
    'jczmi54f': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'l0unxs33': {
      'da': 'Til undervisningen hash og alkohol',
      'kl': '',
    },
    '0p3y0hp1': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'ortmfhnu': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Instruktor_Tilundervisningen
  {
    'tqt63ls1': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'ykw44qh3': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '3za7z06c': {
      'da': 'Instruktør',
      'kl': 'Ilitsersuisoq',
    },
    'rq7e40z1': {
      'da': 'Kursusbevis',
      'kl': 'Pikkorissarnermut uppernarsaat',
    },
    '5pu7eruq': {
      'da': 'Kursusbevis almen',
      'kl': 'Kursusbevis almen',
    },
    '8aqxdeax': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'xba3zl4r': {
      'da': 'PDF Aajuk',
      'kl': 'ANGAJOQQAANUT',
    },
    'rw4wbjsz': {
      'da': 'Kursusbevis hash og alkohol \nhalv dag',
      'kl': 'Kursusbevis hash og alkohol \nhalv dag',
    },
    'oxtn7cv2': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'f3pirpui': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'wfg0dpfn': {
      'da': 'Kursusbevis hash og alkohol \nhel dag',
      'kl': 'Kursusbevis hash og alkohol \nhel dag',
    },
    'qo6fr8a6': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'yrbejmqr': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'wu6xav74': {
      'da': 'Kursusprogrammer (Kalaallisut)',
      'kl': 'Pikkorissarnermi pilersaarutit (Kalaallisut)',
    },
    'swd6ypti': {
      'da': 'Kursusprogram til underviser \nhash og alkohol halv dag',
      'kl': 'Kursusprogram til underviser \nhash og alkohol halv dag',
    },
    'zwp3rh1i': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '2pngz4ec': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'unhe4lm3': {
      'da': 'Kursusprogram til underviser\nhash og alkohol hel dag',
      'kl': 'Kursusprogram til underviser\nhash og alkohol hel dag',
    },
    'tkf0r73e': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'mpzremwo': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '2by2xt6x': {
      'da': 'Kursusprogram Uddannelse af \nunderviser 3 dage',
      'kl': 'Kursusprogram Uddannelse af \nunderviser 3 dage',
    },
    'psbymvdb': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '5qdf2tnb': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'j7nbboi7': {
      'da': 'Kursusprogrammer (Dansk)',
      'kl': 'Kursusprogrammer (Dansk)',
    },
    'ch6oenj8': {
      'da': 'Kursusprogram til underviser\nhash og alkohol halv dag',
      'kl': 'Kursusprogram til underviser\nhash og alkohol halv dag',
    },
    '7ld812s4': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'k2l6yai9': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'ahucnjut': {
      'da': 'Kursusprogram til underviser\nhash og alkohol hel dag',
      'kl': 'Kursusprogram til underviser\nhash og alkohol hel dag',
    },
    'ug8ezj4q': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '9dbii4pn': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'z5tyqqju': {
      'da': 'Kursusprogram Uddannelse af \nunderviser 3 dage',
      'kl': '',
    },
    'k740pb4k': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '85ndzfoc': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '2lsxp32x': {
      'da': 'PowerPoints (Kalaallisut)',
      'kl': 'PowerPoints (Kalaallisut)',
    },
    '8sxa8h5v': {
      'da': 'PowerPoints dag 1',
      'kl': 'PowerPoints dag 1',
    },
    'kmcg6dp4': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '99cyyff6': {
      'da': 'PowerPoints dag 2',
      'kl': 'PowerPoints dag 2',
    },
    'r3q4l78b': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'b0zo3r7f': {
      'da': 'PowerPoints dag 3',
      'kl': 'PowerPoints dag 3',
    },
    'zv47jc7y': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'z8pm6r5x': {
      'da': 'PowerPoint \nHash og alkohol',
      'kl': 'PowerPoint \nHash og alkohol',
    },
    'na0syurz': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'zkyylf24': {
      'da': 'PowerPoints (Dansk)',
      'kl': 'PowerPoints (Qallunaatut)',
    },
    'w63mwsas': {
      'da': 'PowerPoints dag 1',
      'kl': 'PowerPoints dag 1',
    },
    '8zrr94ko': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'd6xtn2is': {
      'da': 'PowerPoints dag 2',
      'kl': 'PowerPoints dag 2',
    },
    'qsid9is0': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'nk773vuj': {
      'da': 'PowerPoints dag 3',
      'kl': 'PowerPoints dag 3',
    },
    'jfsjorcc': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'nism3m9f': {
      'da': 'PowerPoint\nHash og alkohol',
      'kl': 'PowerPoint\nHash og alkohol',
    },
    's1a40kvs': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'bv7zcio0': {
      'da': 'Øvelser til brug i \nundervisningen (Kalaallisut)',
      'kl': 'Sungiusaatit ilitsersuinermi \natugassat  (Kalaallisut)',
    },
    '00cg40kl': {
      'da': 'Øvelse i at undervise',
      'kl': 'Øvelse i at undervise',
    },
    'zubazuko': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '5m1pebpp': {
      'da': 'Øvelse Lokal implementering',
      'kl': 'Øvelse Lokal implementering',
    },
    'ghdlaay8': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'w9w41kk3': {
      'da': 'Før øvelse \nundervisningsprincipper',
      'kl': 'Før øvelse \nundervisningsprincipper',
    },
    'cwx9dqb2': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'zcbt48ks': {
      'da': 'Øvelser til brug i \nundervisningen (Dansk)',
      'kl': 'Øvelser til brug i \nundervisningen (Dansk)',
    },
    'gw45f3de': {
      'da': 'Øvelse i at undervise',
      'kl': 'Øvelse i at undervise',
    },
    '4goso425': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'utvpx6qf': {
      'da': 'Øvelse Lokal implementering',
      'kl': 'Øvelse Lokal implementering',
    },
    '2ez1icic': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'lzixkjmu': {
      'da': 'Før øvelse\nundervisningsprincipper',
      'kl': 'Før øvelse\nundervisningsprincipper',
    },
    '558m1bgc': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'ofywii3m': {
      'da': 'Evalueringsskemaer (Kalaallisut)',
      'kl': 'Nalilersuinermi immersugassat (Kalaallisut)',
    },
    'mq3tmu4k': {
      'da': 'Evaluering af hash og alkohol \nhalv dag',
      'kl': 'Evaluering af hash og alkohol \nhalv dag',
    },
    'fmwgzy1y': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    's8bwd2ay': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'pegbki0i': {
      'da': 'Evaluering af hash og alkohol\nhel dag',
      'kl': 'Evaluering af hash og alkohol\nhel dag',
    },
    'cmkc209j': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'ybc4up0v': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'm1ebmrpq': {
      'da': 'Evaluering af 3 dages kursus',
      'kl': 'Evaluering af 3 dages kursus',
    },
    's7pheg0h': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'aq3lv1bt': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '134gejzu': {
      'da': 'Evalueringsskemaer (Dansk)',
      'kl': 'Evalueringsskemaer (Qallunaatut)',
    },
    '0iv1tdfd': {
      'da': 'Evaluering af hash og alkohol \nhalv dag',
      'kl': 'Evaluering af hash og alkohol \nhalv dag',
    },
    'yfq2dfdf': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'ajr3u8jw': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'o60atarw': {
      'da': 'Evaluering af hash og alkohol\nhel dag',
      'kl': 'Evaluering af hash og alkohol\nhel dag',
    },
    'hkvz8u84': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '4rq6ns25': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    '4dhwxhsh': {
      'da': 'Evaluering af 3 dages kursus',
      'kl': 'Evaluering af 3 dages kursus',
    },
    '4ihgg8vc': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '236o3kpa': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'gfs4fs64': {
      'da': 'Evalueringsskemaer (Dansk)',
      'kl': 'Evalueringsskemaer (Qallunaatut)',
    },
    'b9qbr2pz': {
      'da': 'Evaluering af hash og \nalkohol halv dag',
      'kl': 'Evaluering af hash og \nalkohol halv dag',
    },
    '7qhh0qyf': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '4m4uyixr': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'q2otdlay': {
      'da': 'Evaluering af hash \nog alkohol hel dag',
      'kl': 'Evaluering af hash \nog alkohol hel dag',
    },
    '27nh8j4f': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    '8klhl1bz': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'epi00bck': {
      'da': 'Evaluering af 3 dages kursus',
      'kl': 'Evaluering af 3 dages kursus',
    },
    'g1aq8w2c': {
      'da': 'Hent Word',
      'kl': 'Word Aajuk',
    },
    'cf53dcjj': {
      'da': 'Hent PDF',
      'kl': 'PDF Aajuk',
    },
    'sndmzh42': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Instruktor_Powerpoints
  {
    '47da2ryd': {
      'da': 'Powerpoints',
      'kl': 'Angajoqqaanut',
    },
    'ntzfdyu8': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    '4r30mzh4': {
      'da': 'Instruktør',
      'kl': 'Ilitsersuisoq',
    },
    'ixub4160': {
      'da': '1 Ilinniartitsineq_Meeqqavit pinnguaqatiginera MANU 0-2 år',
      'kl': '',
    },
    '5ydlpe4a': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'kyamtgum': {
      'da': '2 Ilinniartitsineq Meeqqap \npissariaqartitai MANU 3-6 år',
      'kl': '',
    },
    'zm0sl9v1': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'hqontx2q': {
      'da': '3 Ilinniartitsineq Perorsaaneq\nMANU 3-6 år',
      'kl': '',
    },
    '7qmrfcp4': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    '7ywz81b1': {
      'da': '4 Ilinniartitsineq Ataatsimooqatigiinneq\nMANU 3-6 år',
      'kl': '',
    },
    '913ksfrx': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'tse60847': {
      'da': 'Powerpoints (Dansk)',
      'kl': '',
    },
    '22czs4fu': {
      'da': '1 Til undervisning Leg med dit barn\nMANU 0-2 år',
      'kl': '',
    },
    '66cenmdd': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    'iadu9xbn': {
      'da': '2. Til undervisning Om barnets behov\nMANU 3-6 år',
      'kl': '',
    },
    'w2a793jr': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    '4yycfukl': {
      'da': '3 Til undervisning Om opdragelse \nMANU 3-6 år',
      'kl': '',
    },
    '1r28mla6': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    '1h4wgduy': {
      'da': '4 Til undervisning Om fællesskab og samarbejde MANU 3-6 år',
      'kl': '',
    },
    'il710jgw': {
      'da': 'Hent Powerpoint',
      'kl': 'ANGAJOQQAANUT',
    },
    '84qe1mn8': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F_Instruktor_Ekstramateriale
  {
    'nxpkmmgn': {
      'da': 'Ekstra materiale',
      'kl': 'Atortussat allat',
    },
    'e5oklun9': {
      'da': 'Fagfolk',
      'kl': 'Sulisunut ilinniarsimasunut',
    },
    'g3onomaz': {
      'da': 'Instruktør',
      'kl': 'Ilitsersuisoq',
    },
    '0zmn7xf8': {
      'da': 'Litteratur artikler',
      'kl': 'Atuagaatit allaaserisallu',
    },
    '4jue9g7l': {
      'da': 'Artikler',
      'kl': 'Ilanngutassiat',
    },
    'u91djx02': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'e4o47vwj': {
      'da': 'Børn i Grønland SFI',
      'kl': 'Børn i Grønland SFI',
    },
    'woypwcnd': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'l216usvf': {
      'da': 'God undervisning',
      'kl': 'Ilinniartitsineq pitsaasoq',
    },
    'cfekbi6z': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'gzbdyojg': {
      'da': 'Teoretiske perspektiver på \nICS trekantens højde',
      'kl': 'Teoretiske perspektiver på \nICS trekantens højde',
    },
    'vei6didl': {
      'da': 'Download PDF',
      'kl': 'PDF Aajuk',
    },
    'f6gxse7n': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Nyheder
  {
    'zlx3e4uu': {
      'da': 'NYHEDER',
      'kl': 'NUTAARSIASSAT',
    },
    'fx48sycv': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Downloaded_listview
  {
    'ovxv0u88': {
      'da': 'Downloaded Files',
      'kl': '',
    },
  },
  // Audiobookcomponent
  {
    'gj0hsq7y': {
      'da': 'Track Title Here',
      'kl': '',
    },
    'yfrquqrp': {
      'da': 'Artist Name',
      'kl': '',
    },
  },
  // Miscellaneous
  {
    'oczt3u93': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
    'kgotw3g4': {
      'da': 'Forældre',
      'kl': 'Tusarnaagassiaq Aajuk',
    },
    '58s3ai3w': {
      'da': 'Til undervisningen',
      'kl': 'Ilitsersuinermut',
    },
    'csim7ig8': {
      'da': 'Please accepts that Manu APP can save files for offline use',
      'kl': '',
    },
    '0g7xs759': {
      'da': 'Please accepts that Manu APP can save files for offline use',
      'kl': '',
    },
    'jetruzmb': {
      'da': '',
      'kl': '',
    },
    'p3bufnuf': {
      'da': '',
      'kl': '',
    },
    'v1in1dz0': {
      'da': '',
      'kl': '',
    },
    '986oduar': {
      'da': 'Allow Read Files',
      'kl': '',
    },
    'uh3rjf2j': {
      'da': 'Allow Read Files',
      'kl': '',
    },
    'l3yay5ua': {
      'da': 'Allow Read Files',
      'kl': '',
    },
    'dsa2703s': {
      'da': 'Allow Read Files',
      'kl': '',
    },
    'o4imm5j8': {
      'da': 'Allow Read Files',
      'kl': '',
    },
    'ykwclvyn': {
      'da': '',
      'kl': '',
    },
    '0kxnddrm': {
      'da': '',
      'kl': '',
    },
    'g6xw72ol': {
      'da': '',
      'kl': '',
    },
    'x7z6uinp': {
      'da': '',
      'kl': '',
    },
    'x1iwprtd': {
      'da': '',
      'kl': '',
    },
    'edrvgurj': {
      'da': '',
      'kl': '',
    },
    'itp8nbne': {
      'da': '',
      'kl': '',
    },
    'sgzh26un': {
      'da': '',
      'kl': '',
    },
    'wgknp0io': {
      'da': '',
      'kl': '',
    },
    'ftz2fgn0': {
      'da': '',
      'kl': '',
    },
    'v4aagjc3': {
      'da': '',
      'kl': '',
    },
    '9vp4rzh8': {
      'da': '',
      'kl': '',
    },
    '1z5n62mz': {
      'da': '',
      'kl': '',
    },
    '5rh3lkk8': {
      'da': '',
      'kl': '',
    },
    '8n5v5ry2': {
      'da': '',
      'kl': '',
    },
    '011lr915': {
      'da': '',
      'kl': '',
    },
    'de7cy5gb': {
      'da': '',
      'kl': '',
    },
    '5thfwcdm': {
      'da': '',
      'kl': '',
    },
    '2uib7lru': {
      'da': '',
      'kl': '',
    },
    '4quckyjf': {
      'da': '',
      'kl': '',
    },
    'ir9rkzd7': {
      'da': '',
      'kl': '',
    },
    'iq940kc3': {
      'da': '',
      'kl': '',
    },
    '4bfbme3r': {
      'da': '',
      'kl': '',
    },
    'cqtw8wau': {
      'da': '',
      'kl': '',
    },
    '5h9h7fro': {
      'da': '',
      'kl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
