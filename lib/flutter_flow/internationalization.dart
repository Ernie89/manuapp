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
      'kl': 'Fagfolk',
    },
    'pusj9214': {
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
      'da': 'Bøger Til Forældre',
      'kl': 'Angajoqqaanut atuakkat',
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
      'kl': 'Tusarnaangassiat',
    },
    'e0mom9th': {
      'da': 'Lydbøger',
      'kl': 'Tusarnaangassiat',
    },
    '8j7np8rk': {
      'da': 'KALAALLISUT',
      'kl': 'KALAALLISUT',
    },
    'du7jf1mg': {
      'da': 'DANSK',
      'kl': 'QALLUNAATUT',
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
      'da': 'Bøger Til Forældre',
      'kl': 'Angajoqqaanut atuakkat',
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
      'kl': 'Ilisimasallit',
    },
    '5oax3zsn': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'wjlk6ulp': {
      'da': '0-9 måneder',
      'kl': 'Qaammatit siulliit 0-9 ',
    },
    's84z707g': {
      'da': 'Forældrebog',
      'kl': 'Angajoqqaanut atuakkat',
    },
    'zrv5phfv': {
      'da': 'Forældreforberedelse 0-9 mnd',
      'kl': 'Angajoqqaanngornissamut piareersarneq 0-9 mnd',
    },
    'vhv3rmrx': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
          'Hver gang du og dit barn er sammen om en bog, så deler I en oplevelse. Det at sidde tæt og være optaget af det, der sker i bogen, kan give fælles glæde. Og det kan give jer begge en følelse af at høre sammen.\n\nNår du læser en børnebog, er det en anledning til at tale med dit barn om det, der optager det.\nHer finder du alle MANU´s Børnebøger. Til hver børnebog er der en forældrebog til, som giver lidt viden og ideer om det pågældende emne. \n\nBørnebøger og forældrehæfter i serien:\n\n- Manumina og Dit barns første bog\n\n- Manuminas følelser og Dit barns følelser\n\n- Manumina sov godt og Dit barns søvn\n\n- Manumina har skoldkopper og Dit syge barn\n\n- Manumina vasker hænder og Dit barn vasker hænder\n\n- Manuminas krop og Dit barns krop\n\n- Manumina starter i skole og Dit barn starter i skole\n\n- Manumina leger og Dit barns lege og bevægelse',
      'kl':
          '\nMeeqqallu atuagaq sammigaangassiuk taava misigisaqaqatigiittarpusi. Qanimut issiaqatigiilluni atuakkamilu pisunik tiguartisimaarneq ataatsimut nuannaartitsisarpoq. Marluullusilu immissinnut atanissinnik misigisitsisarluni.\n\nMeeqqat atuagaat atuarukku meeqqavit soqutigisaa pillugu oqaluunnissaanut periarfissaqalertarpoq.\nAtaani nanisinnaavatit atuakkat meeqqanoortut MANU-minngaanneersut. Atuakkat meeqqanoortut angajoqqaanut atuagaqartaqarput, sammisamut tunngasunik paasissutissartallit, aammalu isumassarsiffiusinnaasunik.\n\n \n\nMeeqqanut atuakkat angajoqqaanullu mappersakkat nangeqattaartut ukuupput:\n\n- Manumina aammalu Meeqqavit atuagaa siulleq\n\n- Manuminap misigissusai aammalu \n\n- Meeqqavit misigissusai\n\n- Manumina sinilluarit aammalu \n\n- Meeqqavit sininnissaa\n\n- Manumina kuppiararpoq aammalu \n\n- Meeqqat napparsimasoq\n\n\n- Manumina assani errortorpai aammalu Manumina Meeqqat napparsimasoq\n\n- Manuminap timaa aammalu Meeqqavit timaa\n\n- Manumina atualerpoq aammalu Qitornat atualerpoq\n\n- Manumina pinnguarpoq aammalu \n\n- Meeqqavit pinnguarnera aalaneralu',
    },
    'sh1119ny': {
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    'nkqda0rc': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut quppersagaq',
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
      'da': 'Børnebøger',
      'kl': 'Meeqqanut atuakkat',
    },
    '0hhsofai': {
      'da': 'Manumina foldebog',
      'kl': 'Manumina atuagaaraq mappertagaq',
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
      'kl': 'Ilisimasallit',
    },
    '7ne9b9ap': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'etcw4dny': {
      'da': '1 og 2 år',
      'kl': 'Angajoqqaanut',
    },
    'l0ncw2vk': {
      'da': 'Barnet 1 og 2 år',
      'kl': '',
    },
    'bkhyuchn': {
      'da': 'Forældrebog',
      'kl': '',
    },
    'hzhsptm0': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    '8sz26zdp': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'gwdt3pa7': {
      'da': '3 og 4 år',
      'kl': 'Angajoqqaanut',
    },
    'g99jtuo9': {
      'da': 'Forældrebog',
      'kl': '',
    },
    'wtsoxtud': {
      'da': 'Barnet på 3 og 4 år',
      'kl': '',
    },
    'e1czi7bi': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'cx023not': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    '3zqtveyi': {
      'da': '5 og 6 år',
      'kl': 'Angajoqqaanut',
    },
    'iv8ohbet': {
      'da': 'Forældrebog',
      'kl': '',
    },
    '9biuu0jn': {
      'da': 'Barnet 5-6 år',
      'kl': '',
    },
    '1r59skhj': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'lz4baojr': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'up22e2hd': {
      'da': 'Hash',
      'kl': 'Angajoqqaanut',
    },
    'jg6ohxjp': {
      'da': 'MANU',
      'kl': '',
    },
    '0whmfht1': {
      'da': 'Hash information til forældre, Pjece',
      'kl': '',
    },
    'hylr4xyd': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'eytam4iv': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'lgl66mht': {
      'da': 'Alkohol',
      'kl': 'Angajoqqaanut',
    },
    'h6wqtgrv': {
      'da': 'MANU',
      'kl': '',
    },
    'aszkkl66': {
      'da':
          'Information om alkohol til forældre – graviditet, amning og den nye familie. \nPjece',
      'kl': '',
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
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    '1xzjw8lh': {
      'da': 'Bedsteforældre',
      'kl': 'Angajoqqaanut',
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
      'kl': '',
    },
    'dzcbunzs': {
      'da': 'Plastickort 1-2 år',
      'kl': '',
    },
    'o2z34n6c': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '9fo1czvh': {
      'da': 'MANU',
      'kl': '',
    },
    '3oykmiex': {
      'da': 'Spilleregler 5-6 år',
      'kl': '',
    },
    'bi7qi891': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
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
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'b5vdzau3': {
      'da': '1 og 2 år',
      'kl': 'Angajoqqaanut',
    },
    'wigr3fy5': {
      'da': 'MANU',
      'kl': '',
    },
    '8ufsf4h2': {
      'da': 'Plastickort 1-2 år',
      'kl': '',
    },
    '0m85vme3': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'glqpw8la': {
      'da': 'Bøger til forældre',
      'kl': 'Angajoqqaanut',
    },
    'x4t7p2wc': {
      'da': '5-6 år',
      'kl': 'Angajoqqaanut',
    },
    'lmtz7jg1': {
      'da': 'MANU',
      'kl': '',
    },
    '98296wni': {
      'da': 'Spilleregler 5-6 år',
      'kl': '',
    },
    'n3lxiz8m': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Angajoqqaanut',
    },
    'kl1qsc00': {
      'da': 'Forældre',
      'kl': 'Angajoqqaanut',
    },
    'qskyr0cl': {
      'da': 'Animationsvideoer',
      'kl': 'Angajoqqaanut',
    },
    'qif7l3jh': {
      'da': 'Forældreforberedelse 0-9 måneder',
      'kl': '',
    },
    'cbcwjw70': {
      'da': 'MANU',
      'kl': '',
    },
    'qd50vf60': {
      'da': 'Angajoqqaanngornissamut piareersarneq, forældreforberedelse',
      'kl': '',
    },
    'w71kx8bd': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'n231wjl1': {
      'da': 'MANU',
      'kl': '',
    },
    'uj39f689': {
      'da':
          'Pilluarit, Angajoqqaanngulerputit, \nTillykke du skal være forælder',
      'kl': '',
    },
    'gegj4jeb': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'howjyraq': {
      'da': 'MANU',
      'kl': '',
    },
    'rbbc0kit': {
      'da': 'Angajoqqaanngornissamut piareersarneq, Forældreforberedelse',
      'kl': '',
    },
    'w9xzz759': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'cnjijk49': {
      'da': 'MANU',
      'kl': '',
    },
    '4yyn9df2': {
      'da': 'Angajoqqanngornissamut piareersarneq, forældreforberedelse',
      'kl': '',
    },
    '25777av4': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'y17y11js': {
      'da': 'MANU 1-2 år',
      'kl': '',
    },
    'a62jayuv': {
      'da': 'MANU',
      'kl': '',
    },
    'bfqvfn51': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': '',
    },
    'aipxtfc9': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '80w01f0p': {
      'da': 'MANU',
      'kl': '',
    },
    'opi3wt6t': {
      'da': 'Meeqqat ataatsimik marlunnillu ukiullit, Barnet på 1 og 2 år',
      'kl': '',
    },
    '1mrihagh': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '41zcfp9c': {
      'da': 'MANU 3-4 år',
      'kl': '',
    },
    'oncmp8mt': {
      'da': 'MANU',
      'kl': '',
    },
    'rytbaj7f': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': '',
    },
    '2zq0tcjx': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'w1bvc2k8': {
      'da': 'MANU',
      'kl': '',
    },
    'as0b6tpk': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': '',
    },
    'hs0zu5pv': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'cdirqpvg': {
      'da': 'MANU',
      'kl': '',
    },
    'oxmwbvoz': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': '',
    },
    'qe416zv0': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'fz0e66v8': {
      'da': 'MANU',
      'kl': '',
    },
    '2l9ogsi5': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': '',
    },
    'xelk2ely': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'j3clzz33': {
      'da': 'MANU',
      'kl': '',
    },
    'zwxso3qn': {
      'da': 'Meeraq 3-nik aamma 4-nik ukiulik, \nbarnet på 3 og 4 år',
      'kl': '',
    },
    '4bmlx275': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'az2fvwk3': {
      'da': 'MANU 5-6 år',
      'kl': '',
    },
    '1kz9vc5n': {
      'da': 'MANU',
      'kl': '',
    },
    'j98laa22': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': '',
    },
    'dpion24a': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    'epqpg3mi': {
      'da': 'MANU',
      'kl': '',
    },
    'voxe677t': {
      'da': 'Meeraq 5-nik aamma 6-nik ukiulik, \nbarnet på 5 og 6 år',
      'kl': '',
    },
    'xgja3zul': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '155klnxf': {
      'da': 'MANU Hash',
      'kl': '',
    },
    'a4int5hn': {
      'da': 'MANU',
      'kl': '',
    },
    '8awjxeqg': {
      'da': 'Hash',
      'kl': '',
    },
    'qc6qg3du': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '5afx020m': {
      'da': 'MANU',
      'kl': '',
    },
    '8v0pmyrq': {
      'da': 'Hash',
      'kl': '',
    },
    'q2gr0ff4': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '4elx39xo': {
      'da': 'MANU',
      'kl': '',
    },
    'f8e0t9rz': {
      'da': 'Hash',
      'kl': '',
    },
    'pe31facl': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '2lv6awex': {
      'da': 'MANU',
      'kl': '',
    },
    'jch98thu': {
      'da': 'Hash Spot 3',
      'kl': '',
    },
    'p9png05y': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
    },
    '7l6d4hki': {
      'da': 'MANU Alkohol',
      'kl': '',
    },
    'h9ckv2f6': {
      'da': 'MANU',
      'kl': '',
    },
    'ey52oqdz': {
      'da': 'Hash Alkohol',
      'kl': '',
    },
    'pufx60e9': {
      'da': 'Hent Video',
      'kl': 'ATUARUK',
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
      'kl': 'Angajoqqaanut',
    },
    '0ncji0in': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'r99v8m60': {
      'da':
          'MANU bygger på kompetenceudvikling af fagpersonale, som opnår kompetencer til at undervise og gå i dialog med forældrene omkring deres barns trivsel og sundhed.\n\nMaterialet består af:\n\nVejledninger til undervisningen\nPowerpoints til undervisningen\nAnimationsfilm\nEkstra materiale – Plakater, logo, postkort og andet',
      'kl': '',
    },
    '2qw31h4a': {
      'da': 'MANU 0-9 mdr.',
      'kl': 'ANGAJOQQAANUT',
    },
    'is3qlpj6': {
      'da': 'MANU 1-2 år',
      'kl': 'ANGAJOQQAANUT',
    },
    'ajmumzt1': {
      'da': 'Manu 3-4 år',
      'kl': 'ANGAJOQQAANUT',
    },
    '9rn08t7k': {
      'da': 'Manu 5-6 år',
      'kl': 'ANGAJOQQAANUT',
    },
    '77yc693u': {
      'da': 'Manu Alkohol',
      'kl': 'ANGAJOQQAANUT',
    },
    '0yka7x8f': {
      'da': 'Forældremødet',
      'kl': 'ANGAJOQQAANUT',
    },
    'nmohpb9n': {
      'da': 'Manu Hash',
      'kl': 'ANGAJOQQAANUT',
    },
    '9su58rx7': {
      'da': 'Manu Instruktør',
      'kl': 'ANGAJOQQAANUT',
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
      'kl': 'Angajoqqaanut',
    },
    'd9lfzere': {
      'da': 'Børn',
      'kl': 'Angajoqqaanut',
    },
    'g1mauum1': {
      'da': 'Bøgerbøger',
      'kl': 'Angajoqqaanut',
    },
    'bnwcchzm': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'oixhf1zb': {
      'da': 'Manumina foldebog, Barnet første bog',
      'kl': '',
    },
    'j3jc1acp': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'xo0ton9o': {
      'da': 'Børnebøger',
      'kl': '',
    },
    's7zunhk9': {
      'da': 'Manumina starter i skole (Bog)',
      'kl': '',
    },
    'lfnb23l1': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '3oqeke7n': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'va4pi1sp': {
      'da': 'Manumina har skoldkopper (bog)',
      'kl': '',
    },
    '7suesv53': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'uioeh4t4': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '8xtiweth': {
      'da': 'Manuminas følelser (bog)',
      'kl': '',
    },
    'yyr6crd2': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '4iqh7aly': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'b1zqqcih': {
      'da': 'Manuminas krop (bog)',
      'kl': '',
    },
    'nglhy3qo': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'trgdb8r8': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'gjxkqh00': {
      'da': 'Manumina leger (bog)',
      'kl': '',
    },
    'cgiar32d': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'wlkzyi3q': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '3z2s5qzq': {
      'da': 'Manumina vasker hænder (bog)',
      'kl': '',
    },
    'eg6x87jg': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '9ftnwgbo': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'rebegy1d': {
      'da': 'Manumina sov godt (bog)',
      'kl': '',
    },
    'bdcuky6k': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '3q2paiz4': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '66u1abxa': {
      'da': 'Kunuk flytter (Opgavehæfte)',
      'kl': '',
    },
    'qvtlrgrd': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
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
      'kl': 'Ilisimasallit',
    },
    'f92r20qq': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    '4zwvykww': {
      'da': 'Manumina starter i skole',
      'kl': 'Ilisimasallit',
    },
    'js0cumq8': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '6u6esw6z': {
      'da': 'Manumina starter i skole (Bog)',
      'kl': '',
    },
    'uhzl9ioj': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'k00t9sy0': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    'xsidcjqn': {
      'da': 'Manumina har skoldkopper',
      'kl': 'Ilisimasallit',
    },
    'p4fl1yy0': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '73qdp38h': {
      'da': 'Manumina har skoldkopper (bog)',
      'kl': '',
    },
    'aeiruobj': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    '0yzo1zyu': {
      'da': 'Manuminas følelser',
      'kl': 'Ilisimasallit',
    },
    'j9tjemwt': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'wvogdt5b': {
      'da': 'Manuminas følelser (bog)',
      'kl': '',
    },
    '51f2qj4r': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    '3tmyrrky': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Manuminaskropbog
  {
    'yelazrbz': {
      'da': 'Manuminas krop',
      'kl': 'Ilisimasallit',
    },
    '3yf4f8bj': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    '07zbijx2': {
      'da': 'Manuminas krop',
      'kl': 'Ilisimasallit',
    },
    'pxe5td9b': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '67kt47wo': {
      'da': 'Manuminas krop (bog)',
      'kl': '',
    },
    'acepe1rf': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'fewzcglz': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    'wbc3oik5': {
      'da': 'Manumina leger',
      'kl': 'Ilisimasallit',
    },
    '5kled711': {
      'da': 'Børnebøger',
      'kl': '',
    },
    '11xyxut5': {
      'da': 'Manumina leger (bog)',
      'kl': '',
    },
    'j6weljao': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'lp5u1h5g': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    'ze8d8q3v': {
      'da': 'Manumina vasker hænder',
      'kl': 'Ilisimasallit',
    },
    'aem5eebw': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'rx7h8gr8': {
      'da': 'Manumina vasker hænder (bog)',
      'kl': '',
    },
    'm9wxq05o': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'wc5u0dpd': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    'z27cqtkm': {
      'da': 'Manumina sov godt',
      'kl': 'Ilisimasallit',
    },
    '6j6k5uzy': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'utfelbiq': {
      'da': 'Manumina sov godt (bog)',
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
      'kl': 'Ilisimasallit',
    },
    'tcz7yzxw': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    '7cza1q19': {
      'da': 'Kunuk flytter',
      'kl': 'Ilisimasallit',
    },
    '6la4gxa7': {
      'da': 'Børnebøger',
      'kl': '',
    },
    'badp2roi': {
      'da': 'Kunuk flytter (Opgavehæfte)',
      'kl': '',
    },
    'lmulgdf1': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Angajoqqaanut',
    },
    '2l26xvy1': {
      'da': 'Børn',
      'kl': 'Angajoqqaanut',
    },
    'v3pvcvvh': {
      'da': 'Hæfte til forældre',
      'kl': 'Angajoqqaanut',
    },
    '75r9uixg': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'noncnq0c': {
      'da': 'Dit barn starter i skole',
      'kl': '',
    },
    '4i2cs2ex': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '4a44n9kj': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'fgjo5opq': {
      'da': 'Dit barns første bog',
      'kl': '',
    },
    'swvkr1oo': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'en553v6y': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'ipkg28yg': {
      'da': 'Dit syge barn',
      'kl': '',
    },
    'evrzf9dt': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '4is5edkc': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '4lfno3w0': {
      'da': 'Dit barns følelser',
      'kl': '',
    },
    'etrz9qzm': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'mkqohj8r': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'prflmyaw': {
      'da': 'Dit barns krop',
      'kl': '',
    },
    'gyzgff8b': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'z6dwo13h': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '16c87bsz': {
      'da': 'Dit barn vasker hænder',
      'kl': '',
    },
    '5ugqiiip': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    'w1615a59': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'ho4dtepa': {
      'da': 'Dit barns søvn',
      'kl': '',
    },
    'esz78w5d': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
    },
    '9ivg97lg': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '7umiwn4g': {
      'da': 'Dit barns leg og bevægelse',
      'kl': '',
    },
    'ck8q28j2': {
      'da': 'Læs Mere',
      'kl': 'ATUARUK',
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
      'kl': 'Ilisimasallit',
    },
    '0fq55j4e': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'fbdyn97k': {
      'da': 'Børnebøger',
      'kl': 'Ilisimasallit',
    },
    'yzc8ijfy': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'rp9rh4wn': {
      'da': 'Dit barn starter i skole',
      'kl': '',
    },
    'qmg3cwhy': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'z5mhg8zl': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'pir9ek7g': {
      'da': 'Dit barns første bog',
      'kl': 'Ilisimasallit',
    },
    'yt6fn6nw': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'gptf98tr': {
      'da': 'Dit barns første bog',
      'kl': '',
    },
    '66p6d3qp': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'ia20j9yv': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'gf3idg3c': {
      'da': 'Dit syge barn',
      'kl': 'Ilisimasallit',
    },
    'pgpl1tih': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '0fbtxvoi': {
      'da': 'Dit syge barn',
      'kl': '',
    },
    'gs2gm1x2': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    '2owvcem8': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'rt14qav9': {
      'da': 'Dit barns følelser',
      'kl': 'Ilisimasallit',
    },
    'q97sbckv': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'ya53eox4': {
      'da': 'Dit barns følelser',
      'kl': '',
    },
    'zl0538ue': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    '73omil1a': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'sfzfr10q': {
      'da': 'Dit barns krop',
      'kl': 'Ilisimasallit',
    },
    '9lhad2yd': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '97eeekaj': {
      'da': 'Dit barns krop',
      'kl': '',
    },
    'rhefnv2w': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
    },
    'jbwe70dj': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // Ditbarnvaskerhnder
  {
    'nffapabz': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'z4mojber': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'loh63hsl': {
      'da': 'Dit barn vasker hænder',
      'kl': 'Ilisimasallit',
    },
    'xwntyb5h': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'rgl941n1': {
      'da': 'Dit barn vasker hænder',
      'kl': '',
    },
    't9op74ut': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    '2lel71hp': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'zvr0m5rg': {
      'da': 'Dit barns søvn',
      'kl': 'Ilisimasallit',
    },
    '1gey4cu0': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    '3qrm0p2w': {
      'da': 'Dit barns søvn',
      'kl': '',
    },
    '9ijw2qpz': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Ilisimasallit',
    },
    'objqiks6': {
      'da': 'Hæfte til forældre',
      'kl': 'Ilisimasallit',
    },
    'lrvz9weh': {
      'da': 'Dit barns leg og bevægelse',
      'kl': 'Ilisimasallit',
    },
    'fgktlzi2': {
      'da': 'Hæfte til forældre',
      'kl': '',
    },
    'p1l759la': {
      'da': 'Dit barns leg og bevægelse',
      'kl': '',
    },
    'qnojnkkl': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'da': 'Plakat',
      'kl': 'Ilisimasallit',
    },
    'u0a7udoc': {
      'da': 'Plakat',
      'kl': '',
    },
    'e6mmarxd': {
      'da': 'MANU børn plakat',
      'kl': '',
    },
    '9axg22na': {
      'da': 'Download PDF',
      'kl': 'PDF AAJUK',
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
      'kl': 'Meeqqat Silarsuaat',
    },
    'bgl6li55': {
      'da': 'Downloads',
      'kl': 'Meeqqat Silarsuuat',
    },
    'a9v0umsj': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F0-9
  {
    'p9gqdzr3': {
      'da': 'MANU 0-9 år',
      'kl': 'Angajoqqaanut',
    },
    'urfdx21z': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'o6dp1m9a': {
      'da': 'MANU 0-9 år',
      'kl': 'Angajoqqaanut',
    },
    'as99qqby': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'nqd98ql3': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    'mguh9275': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
    },
    'llzhl9wu': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F1-2
  {
    'zjf2gkrr': {
      'da': 'MANU 1-2 år',
      'kl': 'Angajoqqaanut',
    },
    'k0e2krd4': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'dncmyhzw': {
      'da': 'MANU 1-2 år',
      'kl': 'Angajoqqaanut',
    },
    'e9z7ojpo': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'pmnf818e': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    '6f8od50y': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
    },
    '6wqetibf': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
    },
  },
  // F3-4
  {
    '5ce1vet0': {
      'da': 'MANU 3-4 år',
      'kl': 'Angajoqqaanut',
    },
    'hvwcxqx8': {
      'da': 'Falgfolk',
      'kl': 'Angajoqqaanut',
    },
    'tpysyri4': {
      'da': 'MANU 3-4 år',
      'kl': 'Angajoqqaanut',
    },
    'su0gxqtc': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'mcmkotu0': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    'mku6p5qb': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
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
      'kl': 'Angajoqqaanut',
    },
    'ktso7cel': {
      'da': 'MANU 5-6 år',
      'kl': 'Angajoqqaanut',
    },
    '3p3df8ja': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'r6jw9vq0': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    '5x2qivzf': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
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
      'kl': 'Angajoqqaanut',
    },
    'b3h5xs2m': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'l0zbufnx': {
      'da': 'MANU Alkohol',
      'kl': 'Angajoqqaanut',
    },
    'm62ufaoz': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    '8h0dn1rp': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    '5rz298k0': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
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
      'kl': 'Angajoqqaanut',
    },
    'dxjv50kv': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'hkjua5fq': {
      'da': 'MANU Hash',
      'kl': 'Angajoqqaanut',
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
      'kl': 'Angajoqqaanut',
    },
    'mj3qurqe': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'iqdkoyya': {
      'da': 'MANU Instruktør',
      'kl': 'Angajoqqaanut',
    },
    '23vvs7we': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    'fizh4lgf': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    'pzs6qeq1': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
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
      'kl': 'Angajoqqaanut',
    },
    'wgp3ivfj': {
      'da': 'Fagfolk',
      'kl': 'Angajoqqaanut',
    },
    'p3acnnmq': {
      'da': 'MANU Forældremødet',
      'kl': 'Angajoqqaanut',
    },
    '90us2mhu': {
      'da': 'Bøger Til Forældre',
      'kl': 'ANGAJOQQAANUT',
    },
    '58s3ai3w': {
      'da': 'Ekstra materiale',
      'kl': 'ANGAJOQQAANUT',
    },
    '5ya4qn3s': {
      'da': 'Animationsvideoer',
      'kl': 'ANGAJOQQAANUT',
    },
    '0ea5x1ji': {
      'da': 'Hjem',
      'kl': 'Saqqaa',
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
      'kl': 'ANGAJOQQAANUT',
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
