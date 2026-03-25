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

  static List<String> languages() => ['fr', 'ar', 'en'];

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
    String? arText = '',
    String? enText = '',
  }) =>
      [frText, arText, enText][languageIndex] ?? '';

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
  // SplashScreen
  {
    'a1e1ci1s': {
      'fr': 'Agil Energy',
      'ar': 'Agil Energy',
      'en': 'Agil Energy',
    },
    'xlgohyih': {
      'fr': 'Nous alimentons, vous roulez vers le futur',
      'ar': 'نحن نزوّدك بالوقود، وأنت تنطلق نحو المستقبل',
      'en': 'We fuel, you ride to the future',
    },
  },
  // WelcomePage
  {
    'msqob1rt': {
      'fr': 'Bienvenue',
      'ar': 'مرحبًا',
      'en': 'Welcome',
    },
    '2ki5bb6s': {
      'fr':
          'Connectez-vous ou créez un compte\npour commencer votre journée avec \nFastAgil.  ',
      'ar': 'سجّل الدخول أو أنشئ حسابًا لبدء يومك مع FastAgil',
      'en': 'Log in or create an account to start your day with FastAgil.',
    },
    'h92v6zbg': {
      'fr': 'Se connecter',
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    'nt93kssb': {
      'fr': 'S\'inscrire',
      'ar': 'إنشاء حساب',
      'en': 'Register',
    },
    'lqwb6eqe': {
      'fr': 'Continuer avec Google',
      'ar': 'المتابعة باستخدام Google',
      'en': 'Continue with Google',
    },
  },
  // Register
  {
    '0tu23ovs': {
      'fr': 'Créer un compte',
      'ar': 'إنشاء حساب',
      'en': 'Create an account',
    },
    'pfzc5f0j': {
      'fr': 'Remplissez le formulaire pour vous inscrire',
      'ar': 'املأ النموذج للتسجيل',
      'en': 'Fill in the form to sign in',
    },
    'y8adszpw': {
      'fr': 'Nom',
      'ar': 'الاسم',
      'en': 'Last name',
    },
    'zzzzmvt3': {
      'fr': 'Entrez votre nom',
      'ar': 'أدخل اسمك',
      'en': 'Enter your last name',
    },
    'al7bosg8': {
      'fr': 'Prenom',
      'ar': 'الاسم الأول',
      'en': 'First name',
    },
    'cf2xp28c': {
      'fr': 'Entrez votre prenom',
      'ar': 'أدخل اسمك الأول',
      'en': 'Enter your first name',
    },
    'hfvl5uq0': {
      'fr': 'CIN',
      'ar': 'رقم بطاقة الهوية',
      'en': 'Identity card number',
    },
    'r5awvmu5': {
      'fr': 'Entrez votre numéro CIN',
      'ar': 'أدخل رقم بطاقة هويتك',
      'en': 'Enter your Identity card number',
    },
    'pb4zxdf8': {
      'fr': 'Numéro de téléphone',
      'ar': 'رقم الهاتف',
      'en': 'Phone number',
    },
    'bkjabvg4': {
      'fr': 'Entrez votre numéro de téléphone',
      'ar': 'أدخل رقم هاتفك',
      'en': 'Enter your phone number',
    },
    'w4lgj9cu': {
      'fr': 'Adresse e-mail',
      'ar': 'عنوان البريد الإلكتروني',
      'en': 'Email adress',
    },
    'pymai4yk': {
      'fr': 'Entrez votre adresse e-mail',
      'ar': 'أدخل عنوان البريد الإلكتروني',
      'en': 'Enter your email adress',
    },
    'bqkulg1g': {
      'fr': 'Mot de passe',
      'ar': 'كلمة المرور',
      'en': 'Password',
    },
    'n9r1i3nv': {
      'fr': 'Créez un mot de passe',
      'ar': 'أدخل كلمة المرور',
      'en': 'Create a password',
    },
    'ltibk0pc': {
      'fr': 'Confirmer le mot de passe',
      'ar': 'تأكيد كلمة المرور',
      'en': 'Confirm your password',
    },
    'c7354ils': {
      'fr': 'Confirmez votre mot de passe',
      'ar': 'تأكيد كلمة المرور',
      'en': 'Confirm your password',
    },
    'mueyllc2': {
      'fr': 'Créer mon compte',
      'ar': 'إنشاء حساب',
      'en': 'Create my account',
    },
    '0cl5fo0h': {
      'fr': 'Vous avez déjà un compte ? ',
      'ar': 'هل لديك حساب بالفعل ؟',
      'en': 'Already registered ?',
    },
    'erpob9by': {
      'fr': 'Se connecter',
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    'g09q8az5': {
      'fr': 'Le nom est obligatoire.',
      'ar': 'الاسم مطلوب',
      'en': 'Last name is required.',
    },
    'arxdlz06': {
      'fr': 'Minimum 3 caractères.',
      'ar': 'الحد الأدنى 3 أحرف',
      'en': '3 caracters minimum.',
    },
    'h9d3b6x8': {
      'fr': 'Maximum 10 caractères.',
      'ar': 'الحد الأقصى 10 أحرف.',
      'en': '10 caracters maximum.',
    },
    'k8n8gl5o': {
      'fr': 'Veuillez choisir une option',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Choose an option.',
    },
    '2wfdvjde': {
      'fr': 'Le prenom est obligatoire.',
      'ar': 'الاسم الأول مطلوب',
      'en': 'First name is required.',
    },
    'ogtd474a': {
      'fr': 'Maximum 20 caractères.',
      'ar': 'الحد الأقصى 20 أحرف.',
      'en': '20 caracters maximum.',
    },
    'h3witcj0': {
      'fr': 'Veuillez chosir une option',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option',
    },
    'r2kqws5h': {
      'fr': 'CIN is required',
      'ar': 'رقم بطاقة الهوية مطلوب',
      'en': 'Identity card number is required.',
    },
    'tvzs8n45': {
      'fr': 'format CIN invalide.',
      'ar': 'تنسيق رقم بطاقة الهوية غير صالح',
      'en': 'invalid Identity card number format',
    },
    'mivb4vts': {
      'fr': 'Veuillez choisir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option',
    },
    'kkmk78rs': {
      'fr': 'Numéro de telephone obligatoire.',
      'ar': 'رقم الهاتف مطلوب.',
      'en': 'Phone number is required.',
    },
    'rkq6l4ws': {
      'fr': 'Format de téléphone invalide.',
      'ar': 'تنسيق رقم الهاتف  غير صالح',
      'en': 'Invalid phone number format.',
    },
    'zs2tb7f7': {
      'fr': 'Veuillez choisir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    'j40el01i': {
      'fr': 'Le email est obligatoire.',
      'ar': 'البريد الإلكتروني مطلوب',
      'en': 'Email is required.',
    },
    '0jke02g4': {
      'fr': 'format de l\'email est invalide.',
      'ar': 'تنسيق البريد الإلكتروني غير صالح.',
      'en': 'Invalid email format.',
    },
    'qp3ggl4w': {
      'fr': 'Veuillez chosir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    'qz55g08a': {
      'fr': 'Mot de passe obligatoire.',
      'ar': 'كلمة المرور مطلوبة.',
      'en': 'Password is required.',
    },
    '8yjf80et': {
      'fr':
          'Le mot de passe doit contenir une lettre majuscule, un chiifre et un symbol.',
      'ar': 'يجب أن تحتوي كلمة المرور على حرف كبير، رقم، ورمز.',
      'en':
          'Password must contain an uppercase caracter, a number and a symbol.',
    },
    '9vg9ci3n': {
      'fr': 'Veuillez chosir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    '3zw2m8gd': {
      'fr': 'Vous devez confirmer votre mot de passe.',
      'ar': 'يجب عليك تأكيد كلمة المرور.',
      'en': 'You must confirm your password.',
    },
    'ynofpkdw': {
      'fr': 'Veuillez chosir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
  },
  // login
  {
    'g9ck2boh': {
      'fr': 'Bon retour !',
      'ar': 'مرحبًا بعودتك!',
      'en': 'Welcome back!',
    },
    'p8jra0fl': {
      'fr': 'Connectez-vous pour continuer',
      'ar': 'سجّل الدخول للمتابعة',
      'en': 'Log in to continue',
    },
    '50g6syhn': {
      'fr': 'Email',
      'ar': 'البريد الإلكتروني',
      'en': 'Email',
    },
    '0q2d97jq': {
      'fr': 'Entrez votre email',
      'ar': 'أدخل بريدك الإلكتروني',
      'en': 'Enter your email',
    },
    '419n329j': {
      'fr': 'Mot de passe',
      'ar': 'كلمة المرور',
      'en': 'Password',
    },
    '2occwnme': {
      'fr': 'Entrez votre mot de passe',
      'ar': 'أدخل كلمة المرور الخاصة بك',
      'en': 'Enter your password',
    },
    'jjq1ugh3': {
      'fr': 'Se connecter',
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    '2ya1zive': {
      'fr': 'Vous n\'etes pas inscrits ?',
      'ar': 'لست مسجّلًا بعد؟',
      'en': 'Not registered yet?',
    },
    'yzyx9xpi': {
      'fr': 'Inscrivez-vous',
      'ar': 'إنشاء حساب',
      'en': 'Sign up.',
    },
    '1fn5417a': {
      'fr': 'Email obligatoire.',
      'ar': 'البريد الإلكتروني مطلوب.',
      'en': 'Email is required.',
    },
    '8qtho2qg': {
      'fr': 'Veuillez choisir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    '6nzm722j': {
      'fr': 'Mot de passe obligatoire.',
      'ar': 'كلمة المرور مطلوبة.',
      'en': 'Password is required.',
    },
    'yw2knhgq': {
      'fr': 'Veuillez choisir une option.',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
  },
  // Home
  {
    '4mtol28d': {
      'fr': 'Bonjour,',
      'ar': 'مرحبًا،',
      'en': 'Hello,',
    },
    '87e3vf0i': {
      'fr': 'Que souhaitez-vous faire aujourd\'hui ?',
      'ar': 'ماذا تريد أن تفعل اليوم؟',
      'en': 'What would you like to do today?',
    },
    'j56qkcei': {
      'fr': 'TICKET ACTIF',
      'ar': 'تذكرة نشطة',
      'en': 'ACTIVE TICKET',
    },
    's6zvofjs': {
      'fr': 'Votre numéro',
      'ar': 'رقمك',
      'en': 'Your number',
    },
    'qk2uwlp3': {
      'fr': 'Rendez-vous actif',
      'ar': 'موعد نشط',
      'en': 'Active appointment',
    },
    'ts8q08co': {
      'fr': 'Date',
      'ar': 'التاريخ',
      'en': 'Date',
    },
    'pbk4qoho': {
      'fr': 'Actions rapides',
      'ar': 'إجراءات سريعة',
      'en': 'Quick actions',
    },
    'r1vte43y': {
      'fr': 'Rejoindre une file',
      'ar': 'الانضمام إلى صف',
      'en': 'Join a queue',
    },
    '1uxxyrnh': {
      'fr': 'Prenez votre ticket',
      'ar': 'خذ تذكرتك',
      'en': 'Take your ticket',
    },
    'vex611ue': {
      'fr': 'Prendre un RDV',
      'ar': 'حجز موعد',
      'en': 'Book an appointment',
    },
    'usbb600p': {
      'fr': 'Réservez un créneau',
      'ar': 'احجز فترة زمنية',
      'en': 'Reserve a time slot',
    },
    '0oapyzh7': {
      'fr': 'Bornes à proximité',
      'ar': 'الأكشاك القريبة',
      'en': 'Nearby terminals',
    },
    'dhtysd85': {
      'fr': 'Voir tout',
      'ar': 'عرض الكل',
      'en': 'See all',
    },
    'pq5hkhks': {
      'fr': 'Chargé',
      'ar': '',
      'en': '',
    },
    '3k2dhlk3': {
      'fr': 'Home',
      'ar': 'الرئيسية',
      'en': 'Home',
    },
  },
  // KioskMapList
  {
    '1oqtaqg8': {
      'fr': 'Nos kiosques',
      'ar': 'أكشاكنا',
      'en': 'Our kiosks',
    },
    'nv7ryiok': {
      'fr': 'Cherchez le kiosque le plus proche de vous',
      'ar': 'ابحث عن أقرب كشك إليك',
      'en': 'Find the kiosk nearest to you',
    },
    'zb0c7m2q': {
      'fr': 'Cherrchez par nom ou emplacement',
      'ar': 'ابحث بالاسم أو الموقع',
      'en': 'Search by name or location',
    },
    'mj5q65td': {
      'fr': 'Choisir',
      'ar': 'اختر',
      'en': 'Select',
    },
    'e5ij9lyo': {
      'fr': 'Mykiosks',
      'ar': '',
      'en': '',
    },
  },
  // KioskDetail
  {
    'zge459qc': {
      'fr': 'KIOSK OFFICIEL',
      'ar': 'الكشك الرسمي',
      'en': 'Official kiosk',
    },
    'wyebmgsb': {
      'fr': '14',
      'ar': '14',
      'en': '14',
    },
    'wymmloix': {
      'fr': 'File d\'attente',
      'ar': 'طابور / قائمة الانتظار',
      'en': 'Queue',
    },
    'bfj6r8bg': {
      'fr': '~25 min',
      'ar': '~25 دقيقة',
      'en': '~25 min',
    },
    'tewx3a3h': {
      'fr': 'Temps d\'attente',
      'ar': 'وقت الانتظار',
      'en': 'Waiting time',
    },
    'fesowvde': {
      'fr': 'Informations',
      'ar': 'معلومات',
      'en': 'Informations',
    },
    '2g641y6r': {
      'fr': 'Statut actuel',
      'ar': 'الحالة الحالية',
      'en': 'Current status',
    },
    'ezs41lq6': {
      'fr': 'Rejoindre la file',
      'ar': 'انضم إلى قائمة الانتظار',
      'en': 'join queue',
    },
    '4roguqs1': {
      'fr': 'Prendre un RDV',
      'ar': 'احجز موعدًا',
      'en': 'Get an appointment',
    },
    'z4l4pbba': {
      'fr': 'Retour à la liste',
      'ar': 'العودة إلى القائمة',
      'en': 'Back to list',
    },
  },
  // ServiceSelection
  {
    '2g3uw5tz': {
      'fr': 'Choisir un Service',
      'ar': 'اختر خدمة',
      'en': 'Choose a service',
    },
    'qat44wib': {
      'fr': 'Sélectionnez le type de service souhaité pour continuer.',
      'ar': 'حدد نوع الخدمة المطلوبة للمتابعة.',
      'en': 'Select the desired service type to continue.',
    },
    'kjk4c2ev': {
      'fr': 'Carte Électronique',
      'ar': 'بطاقة إلكترونية',
      'en': 'Electronic Card',
    },
    'fk71si8o': {
      'fr': 'Rechargez et gérez votre carte électronique en toute simplicité.',
      'ar': 'اشحن وأدر بطاقتك الإلكترونية بسهولة.',
      'en': 'Top up and manage your electronic card with ease.',
    },
    'y0mz5zks': {
      'fr': 'Carnet de Tickets',
      'ar': 'دفتر التذاكر',
      'en': 'Ticket Booklet',
    },
    'qutnylx5': {
      'fr': 'Achetez un carnet de tickets pour vos déplacements quotidiens.',
      'ar': 'اشترِ دفتر تذاكر لرحلاتك اليومية.',
      'en': 'Buy a ticket booklet for your daily trips.',
    },
    'viq5xlxw': {
      'fr': 'Bon Valeur',
      'ar': 'قيمة جيدة',
      'en': 'Good Value',
    },
    'g87lod61': {
      'fr':
          'Utilisez vos bons valeur pour bénéficier de réductions exclusives.',
      'ar': 'استخدم قسائمك للحصول على خصومات حصرية.',
      'en': 'Use your vouchers to enjoy exclusive discounts.',
    },
  },
  // TicketConfirmation
  {
    '6m9c56tm': {
      'fr': 'Votre ticket',
      'ar': 'تذكرتك',
      'en': 'Your ticket',
    },
    'jghbul7j': {
      'fr': 'Kiosque',
      'ar': 'كشك',
      'en': 'Kiosk',
    },
    'jsnoipv0': {
      'fr': 'SERVICE',
      'ar': 'الخدمة',
      'en': 'SERVICE',
    },
    'k0on1scl': {
      'fr': 'Avant vous',
      'ar': 'قبل دورك',
      'en': 'Ahead',
    },
    '9jnoqryu': {
      'fr': 'Minutes d\'attentes',
      'ar': 'دقائق الانتظار',
      'en': 'Waiting minutes',
    },
    '6ukgy378': {
      'fr': 'Annuler le ticket.',
      'ar': 'إلغاء التذكرة.',
      'en': 'Cancel ticket',
    },
  },
  // QueueTracking
  {
    'i7berm9e': {
      'fr': 'Reperez votre position dans la queue',
      'ar': 'تحديد موقعك في الصف',
      'en': 'Locate your position in the queue',
    },
    'vkok7w05': {
      'fr': 'NUMERO DE TICKET',
      'ar': 'رقم التذكرة',
      'en': 'Ticket number',
    },
    'w6vhgq8m': {
      'fr': 'POSITION',
      'ar': 'الموضع',
      'en': 'Position',
    },
    '9jw33ypr': {
      'fr': 'Temps d\'attente estimé',
      'ar': 'الوقت المتوقع للانتظار',
      'en': 'Estimated waiting time.',
    },
    '84kgnxzp': {
      'fr': 'Minutes',
      'ar': 'دقائق',
      'en': 'Minutes',
    },
    'fsgnnhzj': {
      'fr': 'Basé sur le temps d\'attente \nmoyen de notre kiosque',
      'ar': 'استنادًا إلى متوسط وقت الانتظار في كشكنا',
      'en': 'Based on the average waiting time in this kiosk.',
    },
    'lzz8nb0x': {
      'fr': 'Annuler mon ticket',
      'ar': 'إلغاء تذكرتي',
      'en': 'Cancel my ticket.',
    },
  },
  // AppointmentConfirmation
  {
    '5iq7cj3q': {
      'fr': 'Rendez-vous confirmé',
      'ar': 'تم تأكيد الموعد',
      'en': 'Appointment confirmed',
    },
    'yskhu4vn': {
      'fr': 'Kiosque',
      'ar': 'كشك',
      'en': 'Kiosk',
    },
    'f4ra5xla': {
      'fr': 'SERVICE',
      'ar': 'الخدمة',
      'en': 'SERVICE',
    },
    'o3wmruw4': {
      'fr': 'DATE & HEURE',
      'ar': 'التاريخ والوقت',
      'en': 'DATE & HOUR',
    },
    'fjbilsoq': {
      'fr': 'Code QR de votre résérvation',
      'ar': 'رمز الاستجابة السريعة لحجزك',
      'en': 'Your reservarion QR Code',
    },
    'e9hjt9cx': {
      'fr':
          'Veuillez arrrivez 5 minutes avant le rendez-vous accompagné de votre carte d\'identité',
      'ar': 'يرجى الحضور قبل الموعد بخمس دقائق مع بطاقة هويتك.',
      'en':
          'Please, arrive 5 minutes before the appointment with your identity card.',
    },
    'qypiq8ae': {
      'fr': 'Revenir à l\'acceuil',
      'ar': 'العودة إلى الصفحة الرئيسية',
      'en': 'Back to Home page.',
    },
  },
  // MyTickets
  {
    'uu3n1ylz': {
      'fr': 'Historique de vos tickets.',
      'ar': 'سجل تذاكرك.',
      'en': 'Your ticket history.',
    },
    'b4s9j35a': {
      'fr': 'Tout les status',
      'ar': 'جميع الحالات',
      'en': 'All statuses',
    },
    '132uscof': {
      'fr': 'Traité',
      'ar': 'تمت المعالجة',
      'en': 'Processed',
    },
    '25fkws30': {
      'fr': 'Annulé',
      'ar': 'ملغى',
      'en': 'Cancelled',
    },
    't055ie0n': {
      'fr': 'Mes tickets.',
      'ar': 'تذاكري.',
      'en': 'My tickets.',
    },
  },
  // MyAppointments
  {
    'r48tvemv': {
      'fr': 'Mes Rendez-vous',
      'ar': 'مواعيدي',
      'en': 'My appointments',
    },
    '3aujgj5g': {
      'fr': 'Tous',
      'ar': 'الكل',
      'en': 'All',
    },
    'uwbbyc5l': {
      'fr': 'À venir',
      'ar': 'القادمة',
      'en': 'Upcoming',
    },
    '63eu3j24': {
      'fr': 'Clôturé',
      'ar': 'مغلق',
      'en': 'Processed',
    },
    '8lh5vq91': {
      'fr': 'Annulé',
      'ar': 'ملغى',
      'en': 'Canceled',
    },
    '0jexsz7a': {
      'fr': 'Mes rendez-vous',
      'ar': 'مواعيدي',
      'en': 'My appointments',
    },
  },
  // profile
  {
    '2nxcudaf': {
      'fr': 'Téléphone',
      'ar': 'الهاتف',
      'en': 'Phone',
    },
    'ofjx862p': {
      'fr': 'Email',
      'ar': 'البريد الإلكتروني',
      'en': 'Email',
    },
    '7849b16i': {
      'fr': 'CIN',
      'ar': 'رقم بطاقة الهوية',
      'en': 'Identity card number',
    },
    '0vs7jsjk': {
      'fr': 'Modifier vos informations',
      'ar': 'تعديل معلوماتك',
      'en': 'Edit your informations',
    },
    '1wxavl3t': {
      'fr': 'Se déconnecter',
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    'tr1se6ot': {
      'fr': 'Mon profil',
      'ar': 'ملفي الشخصي',
      'en': 'My profile',
    },
    'bowm7yjz': {
      'fr': 'Profile',
      'ar': 'الملف الشخصي',
      'en': 'profile',
    },
  },
  // notifications
  {
    'n88b1xd5': {
      'fr': 'Notifications',
      'ar': 'الإشعارات',
      'en': 'Notifications',
    },
    '3csrc0sg': {
      'fr': 'Notifications',
      'ar': 'الإشعارات',
      'en': 'Notifications',
    },
  },
  // feedback
  {
    '2tsran2g': {
      'fr': 'Votre avis',
      'ar': 'رأيك',
      'en': 'Your feedback',
    },
    'co25sfj6': {
      'fr': 'Comment évaluez-vous\nvotre expérience ?',
      'ar': 'كيف تقيم تجربتك؟',
      'en': 'How could you evaluate your experience with us ?',
    },
    'lzfnp5ra': {
      'fr': 'Votre retour nous aide à nous améliorer.',
      'ar': 'ملاحظاتك تساعدنا على التحسن.',
      'en': 'Your review helps us imrove our service.',
    },
    'via3289g': {
      'fr': 'Très mauvais',
      'ar': 'سيئ جدًا',
      'en': 'Very bad.',
    },
    'mlxi25x1': {
      'fr': 'Excellent',
      'ar': 'ممتاز',
      'en': 'Excellent',
    },
    'vfe4bu3v': {
      'fr': 'Commentaire (optionnel)',
      'ar': 'تعليق (اختياري)',
      'en': 'Comment (optional)',
    },
    'wwdv27pn': {
      'fr': 'Partagez votre expérience avec nous...',
      'ar': 'شاركنا تجربتك...',
      'en': 'Share your experience with us...',
    },
    'b4vz75s8': {
      'fr': 'Envoyer mon avis',
      'ar': 'إرسال رأيي',
      'en': 'Submit my review.',
    },
    '2ay5lv4e': {
      'fr': 'Merci de prendre le temps de nous évaluer ',
      'ar': 'شكرًا لأخذ الوقت لتقييمنا.',
      'en': 'Thank your evaluating us',
    },
  },
  // settings
  {
    'r3qe7n10': {
      'fr': 'Paramétres',
      'ar': 'الإعدادات',
      'en': 'Settings',
    },
    'jmg98v3f': {
      'fr': 'Théme',
      'ar': 'السمة',
      'en': 'Theme',
    },
    'woxzhxbk': {
      'fr': 'Choisir ce qui vous convient, dark mode ou light mode.',
      'ar': 'اختر ما يناسبك، الوضع الداكن أو الوضع الفاتح.',
      'en': 'Choose your mode',
    },
    '2elyub0k': {
      'fr': 'Langauge',
      'ar': 'السمة',
      'en': 'Theme',
    },
    '01nxz0p7': {
      'fr': 'Choisissez le langiage de l\'application',
      'ar': 'اختر لغة التطبيق',
      'en': 'Choose the application language',
    },
    '8wv3pa78': {
      'fr': 'Francais',
      'ar': 'فرنسية',
      'en': 'French',
    },
    'tsua2vko': {
      'fr': 'Arabe',
      'ar': 'عربية',
      'en': 'Arab',
    },
    'y0dr30me': {
      'fr': 'English',
      'ar': 'الإنجليزية',
      'en': 'English',
    },
    'bgoyfvax': {
      'fr': 'Notifications',
      'ar': 'الإشعارات',
      'en': 'Notifications',
    },
    'yegq0qnz': {
      'fr': 'Recevoir des notifications et des alertes de FastAgil',
      'ar': 'تلقي الإشعارات والتنبيهات من FastAgil',
      'en': 'Receive notifications and alerts from FastAgil',
    },
    'mtjkct2k': {
      'fr': 'Emails',
      'ar': 'البريد الإلكتروني',
      'en': 'Emails',
    },
    '1k6izipb': {
      'fr': 'Recevoir des emails sur l\'activité de FastAgil',
      'ar': 'تلقي رسائل البريد الإلكتروني حول نشاط FastAgil',
      'en': 'Receive emails over FastAgil Activity',
    },
    'kiprlm16': {
      'fr': 'SMS',
      'ar': 'الرسائل النصية',
      'en': 'SMS',
    },
    '8bqxvf27': {
      'fr': 'Recevoir des SMSs de FastAgil',
      'ar': 'تلقي الرسائل النصية من FastAgil',
      'en': 'Receive SMS from FastAgil',
    },
    'qp36lgah': {
      'fr': 'Changer le mot de passe',
      'ar': 'تغيير كلمة المرور',
      'en': 'Change password',
    },
    'dfs592i5': {
      'fr': 'Mettre a jour votre mot de passe de l\'application',
      'ar': 'تحديث كلمة مرور التطبيق الخاصة بك',
      'en': 'Upadate your app password',
    },
    '9mqktnh3': {
      'fr': 'Politique de confidentialité',
      'ar': 'سياسة الخصوصية',
      'en': 'Privacy Policy',
    },
    'j9lp5n97': {
      'fr': 'Lisez nos politiques de confidentialité',
      'ar': 'اقرأ سياسات الخصوصية الخاصة بنا',
      'en': 'Read our privacy policies',
    },
    'ykkjjyio': {
      'fr': 'Se déconnecter',
      'ar': 'تسجيل الخروج',
      'en': 'log out.',
    },
    '07tjxwbb': {
      'fr': 'Version de l\'application',
      'ar': 'إصدار التطبيق',
      'en': 'App version',
    },
    'waj30eu0': {
      'fr': 'v.1.0.0',
      'ar': 'v.1.0.0',
      'en': 'v.1.0.0',
    },
    'evvme0xx': {
      'fr': '© 2026 Touts droits résérvés',
      'ar': '© 2026 جميع الحقوق محفوظة',
      'en': '© 2024 All rights reserved',
    },
  },
  // ticketDetail
  {
    'xlhc0y95': {
      'fr': 'Détail du ticket',
      'ar': 'تفاصيل التذكرة',
      'en': 'Ticket detail',
    },
    '812ajirm': {
      'fr': 'Traité',
      'ar': 'تمت المعالجة',
      'en': 'Processed',
    },
    'xb5vl7mp': {
      'fr': 'Kiosque',
      'ar': 'كشك',
      'en': 'Kiosk',
    },
    'w5i5ih08': {
      'fr': 'Service',
      'ar': 'الخدمة',
      'en': 'Service',
    },
    'vtdertqn': {
      'fr': 'Date',
      'ar': 'التاريخ',
      'en': 'Date',
    },
    'g2bj2tr6': {
      'fr': 'Numéro de ticket',
      'ar': 'رقم التذكرة',
      'en': 'Ticket number',
    },
    'x8upmjbc': {
      'fr': 'Votre demande a été traitée avec succès. Merci de votre visite.',
      'ar': 'تمت معالجة طلبك بنجاح. شكرًا لزيارتك.',
      'en':
          'Your request has been submitted successfylly. Thank you for your visit.',
    },
    '465gteb0': {
      'fr': 'Laisser un avis',
      'ar': 'اترك رأيًا',
      'en': 'Leave a feedback',
    },
  },
  // AppointmentDetail
  {
    'wl6ktovx': {
      'fr': 'Détails de la réservation',
      'ar': 'تفاصيل الحجز',
      'en': 'Rservation detail',
    },
    '9xfhrcr5': {
      'fr': 'Nom du kiosque',
      'ar': 'اسم الكشك',
      'en': 'Kiosk name',
    },
    'ihnwnf0p': {
      'fr': 'Service',
      'ar': 'الخدمة',
      'en': 'Service',
    },
    'qahldyji': {
      'fr': 'DATE',
      'ar': 'التاريخ',
      'en': 'DATE',
    },
    'vj3rctu5': {
      'fr': 'HEURE',
      'ar': 'الوقت',
      'en': 'TIME',
    },
    'elbjhx7z': {
      'fr': 'Le code QR de votre rendez-vous',
      'ar': 'رمز الاستجابة السريعة لموعدك',
      'en': 'Appointment QR Code',
    },
    'km8nbupr': {
      'fr': 'Montrez votre code à votre arrivée au kiosque',
      'ar': 'اعرض رمزك عند وصولك إلى الكشك',
      'en': 'Show your QR Code on arrival',
    },
    'ceo2wuzx': {
      'fr': 'Annuler',
      'ar': 'إلغاء',
      'en': 'Cancel',
    },
  },
  // ChangePassword
  {
    'zbc8entk': {
      'fr': 'Changez votre mot de passe',
      'ar': 'غيّر كلمة المرور الخاصة بك',
      'en': 'Change your password',
    },
    'z7ot807z': {
      'fr': 'Assurez la sécurité de votre mot de passe',
      'ar': 'تأكد من أمان كلمة المرور الخاصة بك.',
      'en': 'Secure your password',
    },
    'sz0p5y4i': {
      'fr': 'Changez le réguliérement',
      'ar': 'غيّره بانتظام.',
      'en': ' change it often',
    },
    '4fr5kvs2': {
      'fr': 'Mot de passe actuel',
      'ar': 'كلمة المرور الحالية',
      'en': 'Current password',
    },
    '377drn7v': {
      'fr': 'Entrez votre mot de passe actuel',
      'ar': 'أدخل كلمة المرور الحالية الخاصة بك',
      'en': 'Enter your actual password',
    },
    '4jtezfma': {
      'fr': 'Noveau mot de passe',
      'ar': 'كلمة المرور الجديدة',
      'en': 'New password',
    },
    'm06rn2yb': {
      'fr': 'Entrez votre nouveau mot de passe',
      'ar': 'أدخل كلمة المرور الجديدة الخاصة بك',
      'en': 'Enter your new password',
    },
    'elgj3k3t': {
      'fr': 'Confirmer votre password',
      'ar': 'تأكيد كلمة المرور الخاصة بك',
      'en': 'Confirm your password',
    },
    'dp4f7iay': {
      'fr': 'Confirmez votre mot de passe',
      'ar': 'أكد كلمة المرور الخاصة بك',
      'en': 'Confirm your password',
    },
    '9apwn9mb': {
      'fr': 'Mot de passe actuelle obligatoire.',
      'ar': 'كلمة المرور الحالية مطلوبة.',
      'en': 'Actual password is required.',
    },
    'mrxy3ty8': {
      'fr': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    'p05zit2h': {
      'fr': 'Nouveau mot de passe obligatoire.',
      'ar': 'كلمة المرور الجديدة مطلوبة.',
      'en': 'New password is required.',
    },
    'ssmhuo39': {
      'fr': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار.',
      'en': 'Please choose an option.',
    },
    '44npoptc': {
      'fr': 'Vous devez confirmer votre nouveau mot de passe.',
      'ar': 'يجب عليك تأكيد كلمة المرور الجديدة الخاصة بك.',
      'en': 'You must confirm your new password',
    },
    'vxunatjx': {
      'fr': 'Please choose an option from the dropdown',
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '37at9lpo': {
      'fr': 'Nos régles',
      'ar': 'قواعدنا',
      'en': 'Our rules',
    },
    '3p9z0dsg': {
      'fr': '• Minimum 8 caractéres',
      'ar': '• 8 أحرف على الأقل',
      'en': '• 8 caracters minimum',
    },
    '2wgzl6d3': {
      'fr': '• Contient majuscule et miniscule',
      'ar': '• يحتوي على أحرف كبيرة وصغيرة',
      'en': '• Contains an uppercase letter',
    },
    'rbiypqqu': {
      'fr': '• Contient un nombre et un symbol',
      'ar': '• يحتوي على رقم ورَمز',
      'en': '• Contains a number and a symbol',
    },
    '5rnhzcsq': {
      'fr': 'Confirmez le changement ',
      'ar': 'تأكيد التغيير',
      'en': 'Submit updates',
    },
  },
  // errorPage
  {
    'zk7foph9': {
      'fr': 'Une erreur s\'est produite',
      'ar': 'حدث خطأ ما',
      'en': 'Something Went Wrong',
    },
    'xr2r78jk': {
      'fr':
          'Nous n\'avons pas chargé le contenu. Veuillez vérifier votre connection Internet et réessayer.',
      'ar': 'تعذر تحميل المحتوى. يرجى التحقق من اتصالك والمحاولة مرة أخرى.',
      'en':
          'We couldn\'t load the content. Please check your connection and try again.',
    },
    'fthzylxp': {
      'fr': 'Réessayer',
      'ar': 'إعادة المحاولة',
      'en': 'Retry',
    },
  },
  // AccountCreated
  {
    '0e72ug8z': {
      'fr': 'Compte créé avec succès !',
      'ar': 'تم إنشاء الحساب بنجاح!',
      'en': 'Account created successfully',
    },
    '96t3f9y6': {
      'fr':
          'Bienvenue a Fast Agil ! Votre compte a été créé avec succès. Vous pouvez maintenant accéder à toutes les fonctionnalités de l\'application.',
      'ar':
          'مرحبًا بك في Fast Agil! تم إنشاء حسابك بنجاح. يمكنك الآن الوصول إلى جميع ميزات التطبيق.',
      'en':
          'Welcome to Fast Agil! Your account has been successfully created. You can now access all the features of the application.',
    },
    'q0q50glu': {
      'fr': 'Ajouter une photo de profil',
      'ar': 'إضافة صورة ملف شخصي',
      'en': 'Add a profile picture',
    },
    'mwv32avh': {
      'fr': 'Ignorer pour le moment',
      'ar': 'تخطي الآن',
      'en': 'Skip for now',
    },
    'hyxmax24': {
      'fr': 'En continuant, vous acceptez nos conditions d\'utilisation.',
      'ar': 'بالمتابعة، فإنك توافق على شروط الاستخدام الخاصة بنا.',
      'en': 'By continuing, you agree to our terms of use.',
    },
  },
  // AddProfilePicture
  {
    'oh77rpz3': {
      'fr': 'Photo de profile',
      'ar': 'صورة الملف الشخصي',
      'en': 'Profile picture',
    },
    'qsosrxqg': {
      'fr': 'Ajoutez votre photo',
      'ar': 'أضف صورتك',
      'en': 'Add your photo',
    },
    '4us2h9e9': {
      'fr':
          'Télécharger votre photo de profile pour que nous puissons vous connaitre',
      'ar': 'قم بتحميل صورة ملفك الشخصي حتى نتمكن من التعرف عليك',
      'en': 'Upload your prodile picture so that we can recognize you',
    },
    'psun05qz': {
      'fr': 'Choisir une photo',
      'ar': 'اختر صورة',
      'en': 'Selecta photo',
    },
    '070zaweo': {
      'fr': 'De la galerie ou bien la caméra',
      'ar': 'من المعرض أو الكاميرا',
      'en': 'From your gallery or your camera',
    },
    'j7gfrzy2': {
      'fr': 'Enregistrer la photo',
      'ar': 'حفظ الصورة',
      'en': 'Save photo',
    },
    'ajo0x7vs': {
      'fr': 'Passer maintenant',
      'ar': 'تخطى الآن',
      'en': 'Skip for now',
    },
  },
  // editProfile
  {
    'd1ugzuft': {
      'fr': 'Modifiez votre profil',
      'ar': 'تعديل ملفك الشخصي',
      'en': 'Edit your profile',
    },
    '5o3q7osi': {
      'fr': 'Nom d\'utilisateur',
      'ar': 'اسم المستخدم',
      'en': 'Username',
    },
    'pje41eej': {
      'fr': 'Entrez votre nom complet',
      'ar': 'أدخل اسمك الكامل',
      'en': 'Enter your full name',
    },
    '703rtafm': {
      'fr': 'Adresse mail',
      'ar': 'عنوان البريد الإلكتروني',
      'en': 'E-mail adress',
    },
    'y8kwj33j': {
      'fr': 'Entrez votre email',
      'ar': 'أدخل بريدك الإلكتروني',
      'en': 'Enter your email adress',
    },
    'tpoeo86w': {
      'fr': 'Téléphone',
      'ar': 'الهاتف',
      'en': 'Phone number',
    },
    'oxj2nax8': {
      'fr':
          'numéro de téléphone ne peux pas etre changé. Veuillez contactez notre support.',
      'ar': 'رقم الهاتف لا يمكن تغييره. يرجى الاتصال بالدعم الفني.',
      'en': 'Phone number cannot be changed. Please contact our support.',
    },
    'i6tban55': {
      'fr': 'CIN',
      'ar': 'رقم البطاقة الوطنية',
      'en': 'Identity card number',
    },
    '5xs7v5ho': {
      'fr': 'La CIN est vérifiée et. nepeut pas etre modifiiée',
      'ar': 'رقم البطاقة الوطنية موثّق ولا يمكن تعديله.',
      'en': 'The ID card number is verified and cannot be modified.',
    },
    '5f3u34qz': {
      'fr': 'Enregistrer les modifications',
      'ar': 'حفظ التغييرات',
      'en': 'Save modifications',
    },
    'y33m9k0c': {
      'fr': 'Le nom complet et obligatoire',
      'ar': 'الاسم الكامل مطلوب',
      'en': 'Full name is required',
    },
    '6ogjmqth': {
      'fr': 'Please choose an option from the dropdown',
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'kv00u2c1': {
      'fr': 'L\'email et obligatoire',
      'ar': 'البريد الإلكتروني مطلوب',
      'en': 'Email is required',
    },
    'wa3x8v85': {
      'fr': 'Please choose an option from the dropdown',
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // AppointmentCalendar
  {
    'fkz484qn': {
      'fr': 'Finalisez votre rendez-vous',
      'ar': 'أكمل موعدك',
      'en': 'Finalize your appointment',
    },
    '57jw6so1': {
      'fr': 'Choisissez un créneau horaire',
      'ar': 'اختر فترة زمنية',
      'en': 'Choose a time slot',
    },
    'n6jmswur': {
      'fr': '08h00',
      'ar': '',
      'en': '',
    },
    'u1awu1hx': {
      'fr': '08h30',
      'ar': '',
      'en': '',
    },
    '87gwrcn5': {
      'fr': '09h00',
      'ar': '',
      'en': '',
    },
    't80gyqkv': {
      'fr': '09h30',
      'ar': '',
      'en': '',
    },
    't7q7ulin': {
      'fr': '10h00',
      'ar': '',
      'en': '',
    },
    '6kq0ankz': {
      'fr': '10h30',
      'ar': '',
      'en': '',
    },
    'v6j9s4zb': {
      'fr': '11h00',
      'ar': '',
      'en': '',
    },
    '8vnrcbwu': {
      'fr': 'Confirmer',
      'ar': 'تأكيد',
      'en': 'Confirm',
    },
  },
  // PolitiqueDeConfidentialite
  {
    'vkmlpqm3': {
      'fr': 'Politique de Confidentialité',
      'ar': 'سياسة الخصوصية',
      'en': 'Privacy Policy',
    },
    'm6zazlcv': {
      'fr': 'Dernière mise à jour',
      'ar': 'آخر تحديث',
      'en': 'Last updated',
    },
    'zcb50ymu': {
      'fr': '1er janvier 2025',
      'ar': '1 يناير 2025',
      'en': 'January 1, 2025',
    },
    '523t7822': {
      'fr': 'Introduction',
      'ar': 'مقدمة',
      'en': 'Introduction',
    },
    'jnf71cr0': {
      'fr':
          'Nous accordons une grande importance à la protection de vos données personnelles. Cette politique de confidentialité explique comment nous collectons, utilisons et protégeons vos informations lorsque vous utilisez notre application.',
      'ar':
          'نولي أهمية كبيرة لحماية بياناتك الشخصية. تشرح سياسة الخصوصية هذه كيفية جمع معلوماتك واستخدامها وحمايتها عند استخدامك لتطبيقنا.',
      'en':
          'We place great importance on the protection of your personal data. This privacy policy explains how we collect, use, and protect your information when you use our application.',
    },
    '4w68slz1': {
      'fr': '1. Collecte des Données',
      'ar': '1. جمع البيانات',
      'en': '1. Data Collection',
    },
    'tsa5xn05': {
      'fr': 'Nous collectons les types d\'informations suivants :',
      'ar': 'نقوم بجمع الأنواع التالية من المعلومات:',
      'en': 'We collect the following types of information:',
    },
    'ukrcqhgr': {
      'fr':
          'Informations d\'identification : nom, adresse e-mail, numéro de téléphone.',
      'ar': 'نقوم بجمع الأنواع التالية من المعلومات:',
      'en': 'We collect the following types of information:',
    },
    'wndmdiry': {
      'fr':
          'Données d\'utilisation : pages visitées, fonctionnalités utilisées, durée des sessions.',
      'ar':
          'بيانات الاستخدام: الصفحات التي تمت زيارتها، الميزات المستخدمة، مدة الجلسات.',
      'en': 'Usage data: pages visited, features used, session duration.',
    },
    'g5dsvz6v': {
      'fr':
          'Données techniques : adresse IP, type d\'appareil, système d\'exploitation.',
      'ar': 'البيانات التقنية: عنوان IP، نوع الجهاز، نظام التشغيل.',
      'en': 'Technical data: IP address, device type, operating system.',
    },
    'k0b5fra4': {
      'fr': '2. Utilisation des Données',
      'ar': '2. استخدام البيانات',
      'en': '2. Use of Data',
    },
    'bfhnhmiq': {
      'fr': 'Vos données personnelles sont utilisées pour :',
      'ar': 'تُستخدم بياناتك الشخصية للأغراض التالية:',
      'en': 'Your personal data is used for:',
    },
    'pdkph1dx': {
      'fr': 'Fournir et améliorer nos services.',
      'ar': 'تقديم خدماتنا وتحسينها.',
      'en': 'Provide and improve our services.',
    },
    'gi7mq3mz': {
      'fr': 'Personnaliser votre expérience utilisateur.',
      'ar': 'تخصيص تجربة المستخدم الخاصة بك.',
      'en': 'Personalize your user experience.',
    },
    'vrs2i2qf': {
      'fr': 'Vous envoyer des notifications importantes et des mises à jour.',
      'ar': 'إرسال الإشعارات الهامة والتحديثات إليك.',
      'en': 'Send you important notifications and updates.',
    },
    '9fckzke6': {
      'fr': 'Assurer la sécurité de votre compte.',
      'ar': 'ضمان أمان حسابك.',
      'en': 'Ensure the security of your account.',
    },
    'j2bnr94i': {
      'fr': '3. Partage des Données',
      'ar': '3. مشاركة البيانات',
      'en': '3. Data Sharing',
    },
    '7w9tx9kc': {
      'fr':
          'Nous ne vendons jamais vos données personnelles à des tiers. Nous pouvons partager vos informations uniquement dans les cas suivants :',
      'ar':
          'نحن لا نبيع بياناتك الشخصية أبدًا لأطراف ثالثة. قد نشارك معلوماتك فقط في الحالات التالي',
      'en':
          'We never sell your personal data to third parties. We may share your information only in the following cases:',
    },
    'kn0h07sy': {
      'fr':
          'Avec des prestataires de services de confiance qui nous aident à exploiter notre application.',
      'ar': 'مع مقدمي الخدمات الموثوقين الذين يساعدوننا في تشغيل تطبيقنا.',
      'en':
          'With trusted service providers who help us operate our application.',
    },
    'zhccc7ac': {
      'fr': 'Lorsque la loi l\'exige ou pour protéger nos droits légaux.',
      'ar': 'عندما يقتضي القانون ذلك أو لحماية حقوقنا القانونية.',
      'en': 'When required by law or to protect our legal rights.',
    },
    '8oizmufy': {
      'fr': '4. Sécurité des Données',
      'ar': '4. أمان البيانات',
      'en': '4. Data Security',
    },
    'g4q1izfe': {
      'fr':
          'Nous mettons en œuvre des mesures de sécurité techniques et organisationnelles appropriées pour protéger vos données contre tout accès non autorisé, toute divulgation, altération ou destruction. Cependant, aucune méthode de transmission sur Internet n\'est totalement sécurisée.',
      'ar':
          'نقوم بتنفيذ تدابير أمنية تقنية وتنظيمية مناسبة لحماية بياناتك من الوصول غير المصرح به أو الكشف أو التعديل أو التدمير. ومع ذلك، لا توجد طريقة نقل عبر الإنترنت آمنة بنسبة 100%.',
      'en':
          'We implement appropriate technical and organizational security measures to protect your data against unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet is completely secure.',
    },
    'qbzm70ei': {
      'fr': '5. Vos Droits',
      'ar': '5. حقوقك',
      'en': '5. Your Rights',
    },
    '13h6oszf': {
      'fr': 'Conformément au RGPD, vous disposez des droits suivants :',
      'ar': 'وفقًا للائحة العامة لحماية البيانات (GDPR)، لديك الحقوق التالية:',
      'en': 'In accordance with the GDPR, you have the following rights:',
    },
    'b760c5s7': {
      'fr': 'Droit d\'accès à vos données personnelles.',
      'ar': 'حق الوصول إلى بياناتك الشخصية.',
      'en': 'Right to access your personal data.',
    },
    'x5a5zseo': {
      'fr': 'Droit de rectification des données inexactes.',
      'ar': 'حق تصحيح البيانات غير الدقيقة.',
      'en': 'Right to rectify inaccurate data.',
    },
    'h1e1qcy7': {
      'fr': 'Droit à l\'effacement (droit à l\'oubli).',
      'ar': 'حق المحو (الحق في النسيان).',
      'en': 'Right to erasure (right to be forgotten).',
    },
    'a1g7bu8a': {
      'fr': 'Droit à la portabilité de vos données.',
      'ar': 'حق نقل البيانات.',
      'en': 'Right to data portability.',
    },
    'rlwfkvdo': {
      'fr': 'Droit d\'opposition au traitement de vos données.',
      'ar': 'حق الاعتراض على معالجة بياناتك.',
      'en': 'Right to object to the processing of your data.',
    },
    '5b6oa81w': {
      'fr': '6. Cookies',
      'ar': '6. ملفات تعريف الارتباط',
      'en': '6. Cookies',
    },
    '4lfe2gjp': {
      'fr':
          'Notre application utilise des cookies et des technologies similaires pour améliorer votre expérience. Vous pouvez configurer votre navigateur pour refuser les cookies, mais cela peut affecter certaines fonctionnalités de l\'application.',
      'ar':
          'يستخدم تطبيقنا ملفات تعريف الارتباط وتقنيات مماثلة لتحسين تجربتك. يمكنك ضبط متصفحك لرفض ملفات تعريف الارتباط، ولكن قد يؤثر ذلك على بعض ميزات التطبيق.',
      'en':
          'Our application uses cookies and similar technologies to enhance your experience. You can configure your browser to refuse cookies, but this may affect certain features of the application.',
    },
    'aegz75xy': {
      'fr': '7. Modifications de la Politique',
      'ar': '7. تعديلات السياسة',
      'en': '7. Policy Modifications',
    },
    'dc10q9co': {
      'fr':
          'Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toute modification sera publiée sur cette page avec une date de mise à jour révisée. Nous vous encourageons à consulter régulièrement cette page.',
      'ar':
          'نحتفظ بالحق في تعديل سياسة الخصوصية هذه في أي وقت. سيتم نشر أي تغييرات على هذه الصفحة مع تاريخ تحديث منقح. نشجعك على مراجعة هذه الصفحة بانتظام.',
      'en':
          'We reserve the right to modify this privacy policy at any time. Any changes will be published on this page with a revised update date. We encourage you to review this page regularly.',
    },
    '7tlhwbt8': {
      'fr': '8. Nous Contacter',
      'ar': '8. اتصل بنا',
      'en': '8. Contact Us',
    },
    'osdl6zt7': {
      'fr':
          'Pour toute question concernant cette politique de confidentialité ou pour exercer vos droits, veuillez nous contacter :',
      'ar':
          'لأي أسئلة بخصوص سياسة الخصوصية هذه أو لممارسة حقوقك، يرجى الاتصال بنا:',
      'en':
          'For any questions regarding this privacy policy or to exercise your rights, please contact us:',
    },
    'yeksd0kg': {
      'fr': 'contact@fastagil.tn',
      'ar': 'contact@fastagil.tn',
      'en': 'contact@fastagil.tn',
    },
    '1uyl2e9b': {
      'fr':
          'Avenue Med Ali Akid, Cité Olympique, El Khadra, 1003 Tunis, Tunisie',
      'ar':
          'المقر الرئيسي لشركة أجيل\nشارع محمد علي عكيد، المدينة الأولمبية، الخضراء، 1003 تونس، تونس',
      'en':
          'AGIL Headquarters\nAvenue Med Ali Akid, Cité Olympique, El Khadra, 1003 Tunis, Tunisia',
    },
    'i6z5vvtl': {
      'fr': 'J\'accepte la politique de confidentialité',
      'ar': '',
      'en': '',
    },
  },
  // informatinalComponent
  {
    'gx4djw62': {
      'fr': 'Fermer',
      'ar': 'إغلاق',
      'en': 'Close',
    },
  },
  // pasDeTicketActif
  {
    '4um9iqyg': {
      'fr': 'Vous n\'avez aucun \nticket actif',
      'ar': 'ليس لديك أي تذكرة نشطة.',
      'en': 'You have no active tickets.',
    },
  },
  // pasDeRDVActif
  {
    '8tmuhyjp': {
      'fr': 'Vous n\'avez aucun \nRDV actif',
      'ar': 'ليس لديك أي موعد نشط.',
      'en': 'You have no active appointments.',
    },
  },
  // Aucunenotification
  {
    'rwm9trd9': {
      'fr': 'Aucune Notification.',
      'ar': 'ليس لديك أي تذكرة نشطة.',
      'en': 'You have no active tickets.',
    },
  },
  // Miscellaneous
  {
    '9mbes61u': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'j7wige3f': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'r9nelhkh': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'm1xp9kha': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'uhyqfgq3': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'zarnd5sm': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'tvws8gu2': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '5du9ic0s': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'd7snm6zf': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'qpe1ohtx': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '492q6tsh': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'av2k9ftv': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '09l4ho1u': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'x183yrf4': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'qzhpq6so': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'aekqow8v': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '0qvwylfk': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'cch47i7g': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '7kyo1eiq': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'kfkn3xls': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'u64ig1gf': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'omyt8y1k': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'q4ekzoth': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'fhvafgf6': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '8w417lsi': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'lwym2e1a': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '9rmxmqr4': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '5t8dcjno': {
      'fr': '',
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
