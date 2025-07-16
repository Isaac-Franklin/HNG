import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ig.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ig')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get welcome;

  /// No description provided for @welcometo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to iAbia'**
  String get welcometo;

  /// No description provided for @slideOneUnderNote.
  ///
  /// In en, this message translates to:
  /// **'A smarter way to connect with your state. Your voice now has a platform.'**
  String get slideOneUnderNote;

  /// No description provided for @teamNote.
  ///
  /// In en, this message translates to:
  /// **'powered by BlueTech Innovations Team'**
  String get teamNote;

  /// No description provided for @slideTwoMainNote.
  ///
  /// In en, this message translates to:
  /// **'Shape the Future of Abia'**
  String get slideTwoMainNote;

  /// No description provided for @slideTwoUnderNote.
  ///
  /// In en, this message translates to:
  /// **'Report issues, suggest solutions, and watch your community grow—together.'**
  String get slideTwoUnderNote;

  /// No description provided for @slideThreeMainNote.
  ///
  /// In en, this message translates to:
  /// **'See It? Report It.'**
  String get slideThreeMainNote;

  /// No description provided for @slideThreeUnderNote.
  ///
  /// In en, this message translates to:
  /// **'From bad roads to power outages, speak up. Your report creates real change.'**
  String get slideThreeUnderNote;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Lets Get You Started With'**
  String get getStarted;

  /// No description provided for @nextstep.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get nextstep;

  /// No description provided for @googlesignin.
  ///
  /// In en, this message translates to:
  /// **'Sign In Using Google Account'**
  String get googlesignin;

  /// No description provided for @facebooksignin.
  ///
  /// In en, this message translates to:
  /// **'Sign In Using Facebook Account'**
  String get facebooksignin;

  /// No description provided for @applesignin.
  ///
  /// In en, this message translates to:
  /// **'Sign In Using Apple Account'**
  String get applesignin;

  /// No description provided for @passwordsignin.
  ///
  /// In en, this message translates to:
  /// **'Sign In Using Password'**
  String get passwordsignin;

  /// No description provided for @newhere.
  ///
  /// In en, this message translates to:
  /// **'New To iAbia? '**
  String get newhere;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register Now '**
  String get register;

  /// No description provided for @noaccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet?'**
  String get noaccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Click here to signup'**
  String get signup;

  /// No description provided for @enteremailaddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get enteremailaddress;

  /// No description provided for @enterpassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get enterpassword;

  /// No description provided for @kindlyenteremailaddress.
  ///
  /// In en, this message translates to:
  /// **'Kindly enter your email address'**
  String get kindlyenteremailaddress;

  /// No description provided for @kindlyenterpassword.
  ///
  /// In en, this message translates to:
  /// **'Kindly enter your password here'**
  String get kindlyenterpassword;

  /// No description provided for @forgotpassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotpassword;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ig'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ig': return AppLocalizationsIg();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
