import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// App title in app bar and system
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get appTitle;

  /// Bottom nav: Games tab
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get navGames;

  /// Bottom nav: Apps tab
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get navApps;

  /// Bottom nav: Search tab
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// Bottom nav: Books tab
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get navBooks;

  /// Store tab: recommended / for you
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get tabRecommended;

  /// Store tab: top charts
  ///
  /// In en, this message translates to:
  /// **'Top charts'**
  String get tabTopCharts;

  /// Store tab: kids
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get tabKids;

  /// Store tab: paid
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get tabPaid;

  /// Store tab: categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get tabCategories;

  /// Primary install button on product card
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get buttonInstall;

  /// Sample/fragment button for books
  ///
  /// In en, this message translates to:
  /// **'Sample'**
  String get buttonFragment;

  /// Free price tag on product
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get tagFree;

  /// Label for products with in-app purchases
  ///
  /// In en, this message translates to:
  /// **'In-app purchases'**
  String get tagContainsPaidContent;

  /// Empty state when no content
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get emptyNoData;

  /// Search field placeholder in books store
  ///
  /// In en, this message translates to:
  /// **'Search books'**
  String get searchBooksHint;

  /// No description provided for @for_you_title.
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get for_you_title;

  /// No description provided for @apps_work_title.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get apps_work_title;

  /// No description provided for @apps_new_releases_title.
  ///
  /// In en, this message translates to:
  /// **'New releases'**
  String get apps_new_releases_title;

  /// Section title: about game
  ///
  /// In en, this message translates to:
  /// **'About this game'**
  String get aboutGame;

  /// Section title: about app
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get aboutApp;

  /// Section title: about book
  ///
  /// In en, this message translates to:
  /// **'About this book'**
  String get aboutBook;

  /// Section title: about product (generic)
  ///
  /// In en, this message translates to:
  /// **'About this product'**
  String get aboutProduct;

  /// Description section title
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Section title for book type (audio/electronic)
  ///
  /// In en, this message translates to:
  /// **'About this {bookType} book'**
  String aboutBookType(Object bookType);

  /// Book type: audio
  ///
  /// In en, this message translates to:
  /// **'audio'**
  String get bookTypeAudio;

  /// Book type: electronic
  ///
  /// In en, this message translates to:
  /// **'electronic'**
  String get bookTypeElectronic;

  /// Link/section: about author
  ///
  /// In en, this message translates to:
  /// **'About the author'**
  String get aboutAuthor;

  /// Section: app support
  ///
  /// In en, this message translates to:
  /// **'App support'**
  String get appSupport;

  /// Carousel title: similar games
  ///
  /// In en, this message translates to:
  /// **'Similar games'**
  String get similarGames;

  /// Carousel title: similar apps
  ///
  /// In en, this message translates to:
  /// **'Similar apps'**
  String get similarApps;

  /// Carousel title: similar books
  ///
  /// In en, this message translates to:
  /// **'Similar books'**
  String get similarBooks;

  /// Refund policy link text
  ///
  /// In en, this message translates to:
  /// **'Google Play refund policy'**
  String get refundPolicy;

  /// VAT disclaimer in footer
  ///
  /// In en, this message translates to:
  /// **'All prices include VAT.'**
  String get pricesIncludeVat;

  /// Permissions screen subtitle
  ///
  /// In en, this message translates to:
  /// **'App permissions'**
  String get permissionsTitle;

  /// Permissions list header with version
  ///
  /// In en, this message translates to:
  /// **'Possible permissions for version {version}'**
  String permissionsForVersion(Object version);

  /// Support item: website
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get supportWebsite;

  /// Support item: email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get supportEmail;

  /// Support item: privacy
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get supportPrivacy;

  /// Support section: about developer
  ///
  /// In en, this message translates to:
  /// **'About the developer'**
  String get supportAboutDeveloper;

  /// Rating info dialog title
  ///
  /// In en, this message translates to:
  /// **'How ratings are calculated'**
  String get ratingHowCalculated;

  /// Rating explanation text
  ///
  /// In en, this message translates to:
  /// **'Ratings are based on recent reviews from users in your region using the same type of device. Reviews are from users with verified Google accounts based on their experience with the app.'**
  String get ratingDisclaimer;

  /// Learn more / details link
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get detailsMore;

  /// Dialog OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get dialogOk;

  /// Format label: e-book
  ///
  /// In en, this message translates to:
  /// **'E-book'**
  String get formatEbook;

  /// Format label: audiobook
  ///
  /// In en, this message translates to:
  /// **'Audiobook'**
  String get formatAudiobook;

  /// Downloads count label
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// Pages abbreviation
  ///
  /// In en, this message translates to:
  /// **'p.'**
  String get pagesShort;

  /// Details tab/section: info
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get detailsInfo;

  /// What's new section title
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get whatsNew;

  /// No info placeholder
  ///
  /// In en, this message translates to:
  /// **'No information'**
  String get noInformation;

  /// More / expand label
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Contains ads label
  ///
  /// In en, this message translates to:
  /// **'Contains ads'**
  String get hasAds;

  /// Ads disclaimer text
  ///
  /// In en, this message translates to:
  /// **'The developer shows ads in this app.'**
  String get adsDisclaimer;

  /// Achievements section title
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// Achievements description
  ///
  /// In en, this message translates to:
  /// **'You will earn achievements for completing goals.'**
  String get achievementsDescription;

  /// Detail row: version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get labelVersion;

  /// Detail row: last update
  ///
  /// In en, this message translates to:
  /// **'Last update'**
  String get labelLastUpdate;

  /// Detail row: downloads
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get labelDownloads;

  /// Detail row: size
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get labelSize;

  /// Detail row: developer
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get labelDeveloper;

  /// Detail row: release date
  ///
  /// In en, this message translates to:
  /// **'Release date'**
  String get labelReleaseDate;

  /// Detail row: permissions
  ///
  /// In en, this message translates to:
  /// **'App permissions'**
  String get labelPermissions;

  /// Detail row: more
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get labelMore;

  /// Detail row: author
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get labelAuthor;

  /// Detail row: publisher
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get labelPublisher;

  /// Detail row: publication date
  ///
  /// In en, this message translates to:
  /// **'Publication date'**
  String get labelPublishDate;

  /// Detail row: pages
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get labelPages;

  /// Detail row: language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get labelLanguage;

  /// Detail row: format
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get labelFormat;

  /// Detail row: genres
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get labelGenres;

  /// Product menu: share
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get menuShare;

  /// Product menu: add to wishlist
  ///
  /// In en, this message translates to:
  /// **'Add to wishlist'**
  String get menuWishlist;

  /// Product menu: report
  ///
  /// In en, this message translates to:
  /// **'Report a problem'**
  String get menuReport;

  /// Share text template with product title and url
  ///
  /// In en, this message translates to:
  /// **'Check this out on Google Play:\n\n{title}\n\n{url}'**
  String shareMessage(Object title, Object url);

  /// Filter label: categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get filterCategories;

  /// Filter: top free
  ///
  /// In en, this message translates to:
  /// **'Top free'**
  String get filterTopFree;

  /// Filter: top charts
  ///
  /// In en, this message translates to:
  /// **'Top charts'**
  String get filterTopCharts;

  /// Filter: genre
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get filterGenre;

  /// Filter: age
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get filterAge;

  /// Filter: by rating
  ///
  /// In en, this message translates to:
  /// **'By rating'**
  String get filterByRating;

  /// Filter: language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get filterLanguage;

  /// Filter: abridged edition
  ///
  /// In en, this message translates to:
  /// **'Abridged edition'**
  String get filterAbridged;

  /// Product page app bar fallback
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productPageTitle;

  /// Product not found error
  ///
  /// In en, this message translates to:
  /// **'Product not found'**
  String get productNotFound;

  /// Category: all categories
  ///
  /// In en, this message translates to:
  /// **'All categories'**
  String get categoryAll;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get categoryGamesArcade;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Trivia'**
  String get categoryGamesTrivia;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Puzzle'**
  String get categoryGamesPuzzle;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Racing'**
  String get categoryGamesRacing;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Casino'**
  String get categoryGamesCasino;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Casual'**
  String get categoryGamesCasual;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get categoryGamesCard;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get categoryGamesMusic;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Board'**
  String get categoryGamesBoard;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Educational'**
  String get categoryGamesEducational;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get categoryGamesAdventure;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Role playing'**
  String get categoryGamesRolePlaying;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Simulation'**
  String get categoryGamesSimulation;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Word'**
  String get categoryGamesWord;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categoryGamesSports;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get categoryGamesStrategy;

  /// Games category
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get categoryGamesAction;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Auto & vehicles'**
  String get categoryAppsCars;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get categoryAppsBusiness;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Video players & editors'**
  String get categoryAppsVideo;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Food & drink'**
  String get categoryAppsFood;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'House & home'**
  String get categoryAppsHouse;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Health & fitness'**
  String get categoryAppsHealth;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Dating'**
  String get categoryAppsDating;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get categoryAppsTools;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Art & design'**
  String get categoryAppsArt;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Maps & navigation'**
  String get categoryAppsMaps;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Books & reference'**
  String get categoryAppsBooks;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Comics'**
  String get categoryAppsComics;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get categoryAppsBeauty;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Parenting'**
  String get categoryAppsParenting;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Medical'**
  String get categoryAppsMedical;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get categoryAppsEvents;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Music & audio'**
  String get categoryAppsMusicAudio;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'News & magazines'**
  String get categoryAppsNews;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryAppsEducation;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get categoryAppsPersonalization;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get categoryAppsWeather;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get categoryAppsShopping;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Watch apps'**
  String get categoryAppsWatch;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get categoryAppsTravel;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get categoryAppsWork;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get categoryAppsEntertainment;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryAppsOther;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get categoryAppsCommunication;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get categoryAppsSocial;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categoryAppsSports;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get categoryAppsLifestyle;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get categoryAppsFinance;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get categoryAppsPhoto;

  /// Apps category
  ///
  /// In en, this message translates to:
  /// **'Watch faces'**
  String get categoryAppsWatchFaces;

  /// Books genre: all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryBooksAll;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Business & investing'**
  String get categoryBooksBusiness;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Biography & memoir'**
  String get categoryBooksBiography;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Detective & thriller'**
  String get categoryBooksDetective;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get categoryBooksChildren;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Mind, body & spirit'**
  String get categoryBooksMindBody;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Health & sports'**
  String get categoryBooksHealthSports;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get categoryBooksHistory;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Computers & technology'**
  String get categoryBooksComputers;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Cooking & home'**
  String get categoryBooksCooking;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get categoryBooksRomance;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Self-help'**
  String get categoryBooksSelfHelp;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Sci-fi & fantasy'**
  String get categoryBooksFantasy;

  /// Books genre
  ///
  /// In en, this message translates to:
  /// **'Fiction'**
  String get categoryBooksFiction;

  /// Filter option: top free
  ///
  /// In en, this message translates to:
  /// **'Top free'**
  String get filterTopFreeOption;

  /// Filter option: bestsellers
  ///
  /// In en, this message translates to:
  /// **'Bestsellers'**
  String get filterBestsellers;

  /// Filter option: top paid
  ///
  /// In en, this message translates to:
  /// **'Top paid'**
  String get filterTopPaid;

  /// Filter option: all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// Age filter option
  ///
  /// In en, this message translates to:
  /// **'Ages 5 and under'**
  String get ageUnder5;

  /// Age filter option
  ///
  /// In en, this message translates to:
  /// **'Ages 6–8'**
  String get age6to8;

  /// Age filter option
  ///
  /// In en, this message translates to:
  /// **'Ages 9–12'**
  String get age9to12;

  /// Age filter option
  ///
  /// In en, this message translates to:
  /// **'Ages 13+'**
  String get age13plus;

  /// Rating filter: all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ratingAll;

  /// Rating filter option
  ///
  /// In en, this message translates to:
  /// **'4.5★ & up'**
  String get rating45Up;

  /// Rating filter option
  ///
  /// In en, this message translates to:
  /// **'4.0★ & up'**
  String get rating40Up;

  /// Abridged version option
  ///
  /// In en, this message translates to:
  /// **'Abridged'**
  String get versionAbridged;

  /// Full version option
  ///
  /// In en, this message translates to:
  /// **'Full version'**
  String get versionFull;

  /// Kids screen hero title
  ///
  /// In en, this message translates to:
  /// **'Kids – the best for families'**
  String get kidsHeroTitle;

  /// Kids screen hero subtitle
  ///
  /// In en, this message translates to:
  /// **'All apps in the Kids tab – both educational and fun – are approved by teachers and marked with a special badge.'**
  String get kidsHeroSubtitle;

  /// Kids section title
  ///
  /// In en, this message translates to:
  /// **'For learning and more'**
  String get kidsSectionLearning;

  /// Kids section intro text
  ///
  /// In en, this message translates to:
  /// **'Together with teachers, education specialists, and media specialists we select the best kids’ apps on Google Play. Experts rate apps and approve only those that:'**
  String get kidsSectionLearningText;

  /// Kids criteria bullet 1
  ///
  /// In en, this message translates to:
  /// **'deliver positive experiences and inspiration;'**
  String get kidsBullet1;

  /// Kids criteria bullet 2
  ///
  /// In en, this message translates to:
  /// **'match the age group;'**
  String get kidsBullet2;

  /// Kids criteria bullet 3
  ///
  /// In en, this message translates to:
  /// **'are well designed.'**
  String get kidsBullet3;

  /// Kids consultants section title
  ///
  /// In en, this message translates to:
  /// **'Our lead advisors:'**
  String get kidsConsultants;

  /// Kids consultants names
  ///
  /// In en, this message translates to:
  /// **'Joe Blatt, Harvard Graduate School of Education;\nDr. Sandra Calvert, Georgetown University.'**
  String get kidsConsultantsList;

  /// Teacher approved badge title
  ///
  /// In en, this message translates to:
  /// **'Teacher approved badge'**
  String get kidsBadgeTitle;

  /// Notifications screen title
  ///
  /// In en, this message translates to:
  /// **'Notifications and offers'**
  String get notificationsTitle;

  /// Notifications empty state title
  ///
  /// In en, this message translates to:
  /// **'Nothing here'**
  String get notificationsEmptyTitle;

  /// Notifications empty state description
  ///
  /// In en, this message translates to:
  /// **'Notifications about your Google Play account will appear here.'**
  String get notificationsEmptyDescription;

  /// Kids badge detailed description
  ///
  /// In en, this message translates to:
  /// **'If an app has the \"Teacher approved\" badge, you will see it at the top of the details page. Below you will find reviews from teachers and experts. From them you can learn, for example, whether the app helps develop imagination and curiosity.'**
  String get kidsBadgeDescription;

  /// Kids services section title
  ///
  /// In en, this message translates to:
  /// **'Services and apps for students'**
  String get kidsServicesTitle;

  /// Kids services section description
  ///
  /// In en, this message translates to:
  /// **'Apps from Google Play (including teacher-approved ones) may not be available for G Suite for Education school accounts. Tip for teachers: ask your system administrator which apps and services can be used at your institution. Learn more about school apps on the Chromebook App Hub portal.'**
  String get kidsServicesDescription;

  /// Megabytes unit for app/game size
  ///
  /// In en, this message translates to:
  /// **'MB'**
  String get unitMb;

  /// Short label for millions (e.g. 5.2 M)
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get unitMillion;

  /// Short label for thousands (e.g. 1.5 K)
  ///
  /// In en, this message translates to:
  /// **'K'**
  String get unitThousand;

  /// Label for reviews count (e.g. 5.2 M reviews)
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviewsCountLabel;

  /// Details screen section title: more / additional
  ///
  /// In en, this message translates to:
  /// **'More info'**
  String get detailsSectionExtra;

  /// Error when store tabs fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load tabs: {error}'**
  String failedToLoadTabs(Object error);

  /// Filter label: recent / new
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get filterRecent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
