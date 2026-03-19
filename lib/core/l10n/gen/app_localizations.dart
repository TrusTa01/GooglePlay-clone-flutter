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

  /// Config tab label: recommended
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get recommended_tab_label;

  /// Config tab label: best charts
  ///
  /// In en, this message translates to:
  /// **'Top charts'**
  String get best_tab_label;

  /// Config tab label: kids
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kids_tab_label;

  /// Config tab label: paid
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid_tab_label;

  /// Config tab label: categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories_tab_label;

  /// Config tab label: top sales
  ///
  /// In en, this message translates to:
  /// **'Top sales'**
  String get top_sales_tab_label;

  /// Config tab label: new releases
  ///
  /// In en, this message translates to:
  /// **'New releases'**
  String get new_releases_tab_label;

  /// Config tab label: genres
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres_tab_label;

  /// Config tab label: top free
  ///
  /// In en, this message translates to:
  /// **'Top free'**
  String get top_free_tab_label;

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

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Action Games'**
  String get action_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Adventure Games'**
  String get adventure_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Anime Games'**
  String get anime_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Art Design'**
  String get apps_art_design_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Auto Vehicles'**
  String get apps_auto_vehicles_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Books Reference'**
  String get apps_books_reference_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Business'**
  String get apps_business_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Communication'**
  String get apps_communication_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Dark Mode'**
  String get apps_dark_mode_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Dating'**
  String get apps_dating_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Education'**
  String get apps_education_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Entertainment'**
  String get apps_entertainment_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Events'**
  String get apps_events_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Finance'**
  String get apps_finance_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Food Drink'**
  String get apps_food_drink_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Free'**
  String get apps_free_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Health Fitness'**
  String get apps_health_fitness_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps House Home'**
  String get apps_house_home_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Lists'**
  String get apps_lists_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Medical'**
  String get apps_medical_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Music Audio'**
  String get apps_music_audio_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Navigation'**
  String get apps_navigation_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps News'**
  String get apps_news_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps No Ads'**
  String get apps_no_ads_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Offline'**
  String get apps_offline_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Parenting'**
  String get apps_parenting_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Photography'**
  String get apps_photography_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Popular'**
  String get apps_popular_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Popular'**
  String get apps_popular_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Productivity'**
  String get apps_productivity_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Security'**
  String get apps_security_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Shopping'**
  String get apps_shopping_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Social'**
  String get apps_social_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Sports'**
  String get apps_sports_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Top Rated'**
  String get apps_top_rated_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Travel'**
  String get apps_travel_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Utilities'**
  String get apps_utilities_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Video Players'**
  String get apps_video_players_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Weather'**
  String get apps_weather_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Widgets'**
  String get apps_widgets_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Apps Work Tools'**
  String get apps_work_tools_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Arcade Games'**
  String get arcade_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Best Indie Games'**
  String get best_indie_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Board Games'**
  String get board_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Architecture'**
  String get books_architecture_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Art'**
  String get books_art_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Award Winning'**
  String get books_award_winning_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Bestseller'**
  String get books_bestseller_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Biography'**
  String get books_biography_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Business'**
  String get books_business_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Children'**
  String get books_children_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Classic'**
  String get books_classic_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Comics'**
  String get books_comics_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Cooking'**
  String get books_cooking_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Economics'**
  String get books_economics_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Education'**
  String get books_education_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Fantasy'**
  String get books_fantasy_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Free'**
  String get books_free_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Graphic Novel'**
  String get books_graphic_novel_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Health'**
  String get books_health_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books History'**
  String get books_history_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Horror'**
  String get books_horror_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Law'**
  String get books_law_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Memoir'**
  String get books_memoir_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Music'**
  String get books_music_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Mystery'**
  String get books_mystery_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Nature'**
  String get books_nature_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books New'**
  String get books_new_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Parenting'**
  String get books_parenting_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Philosophy'**
  String get books_philosophy_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Poetry'**
  String get books_poetry_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Politics'**
  String get books_politics_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Psychology'**
  String get books_psychology_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Religion'**
  String get books_religion_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Romance'**
  String get books_romance_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Science Fiction'**
  String get books_science_fiction_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Science'**
  String get books_science_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Self Help'**
  String get books_self_help_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Series'**
  String get books_series_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Short Stories'**
  String get books_short_stories_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Sports'**
  String get books_sports_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Technology'**
  String get books_technology_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Thriller'**
  String get books_thriller_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Top Rated'**
  String get books_top_rated_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Top Rated'**
  String get books_top_rated_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Translated'**
  String get books_translated_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Books Travel'**
  String get books_travel_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Building Games'**
  String get building_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Casual Games'**
  String get casual_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Co Op Games'**
  String get co_op_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Crafting Games'**
  String get crafting_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Games'**
  String get cyberpunk_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Fantasy Games'**
  String get fantasy_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Fighting Games'**
  String get fighting_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Games Offline'**
  String get games_offline_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Games Unusual Puzzle'**
  String get games_unusual_puzzle_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Home Grid Everyone Plays'**
  String get home_grid_everyone_plays_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Home Grid Everyone Plays'**
  String get home_grid_everyone_plays_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Horror Games'**
  String get horror_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Indie Games'**
  String get indie_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids 2d'**
  String get kids_2d_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids 3d'**
  String get kids_3d_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Abstract'**
  String get kids_abstract_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Adventure'**
  String get kids_adventure_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Age 12'**
  String get kids_age_12_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Age 3'**
  String get kids_age_3_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Age 6'**
  String get kids_age_6_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Alphabet'**
  String get kids_alphabet_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Arcade'**
  String get kids_arcade_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Board'**
  String get kids_board_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Building'**
  String get kids_building_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Cartoons'**
  String get kids_cartoons_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Casual'**
  String get kids_casual_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Co Op'**
  String get kids_co_op_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Creativity'**
  String get kids_creativity_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Crossplatform'**
  String get kids_crossplatform_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Drawing'**
  String get kids_drawing_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Educational'**
  String get kids_educational_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Exploration'**
  String get kids_exploration_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Fairy Tales'**
  String get kids_fairy_tales_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Family'**
  String get kids_family_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Free'**
  String get kids_free_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Health'**
  String get kids_health_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Hero Banner'**
  String get kids_hero_banner_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Hero Banner'**
  String get kids_hero_banner_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Languages'**
  String get kids_languages_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Letters'**
  String get kids_letters_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Logic'**
  String get kids_logic_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Math'**
  String get kids_math_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Minimalist'**
  String get kids_minimalist_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Multiplayer'**
  String get kids_multiplayer_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Music'**
  String get kids_music_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids New And Updated'**
  String get kids_new_and_updated_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids New Releases'**
  String get kids_new_releases_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Numbers'**
  String get kids_numbers_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Offline'**
  String get kids_offline_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Pixel Art'**
  String get kids_pixel_art_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Popular'**
  String get kids_popular_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Procedural'**
  String get kids_procedural_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Puzzle'**
  String get kids_puzzle_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Relaxing'**
  String get kids_relaxing_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Retro'**
  String get kids_retro_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Rpg'**
  String get kids_rpg_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Simulation'**
  String get kids_simulation_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Story Rich'**
  String get kids_story_rich_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Strategy'**
  String get kids_strategy_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Stylized'**
  String get kids_stylized_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Top Rated'**
  String get kids_top_rated_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Top Rated'**
  String get kids_top_rated_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Trivia'**
  String get kids_trivia_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Turn Based'**
  String get kids_turn_based_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Kids Word'**
  String get kids_word_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Low Price Games'**
  String get low_price_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Multiplayer Games'**
  String get multiplayer_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'New Releases'**
  String get new_releases_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'New Releases'**
  String get new_releases_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Offline Games'**
  String get offline_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Open World Games'**
  String get open_world_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Action Games'**
  String get paid_action_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Adventure Games'**
  String get paid_adventure_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Anime Games'**
  String get paid_anime_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Arcade Games'**
  String get paid_arcade_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Board Games'**
  String get paid_board_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Building Games'**
  String get paid_building_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Casual Games'**
  String get paid_casual_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Co Op Games'**
  String get paid_co_op_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Crafting Games'**
  String get paid_crafting_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Cyberpunk Games'**
  String get paid_cyberpunk_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Esports Games'**
  String get paid_esports_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Exploration Games'**
  String get paid_exploration_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Fantasy Games'**
  String get paid_fantasy_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Fighting Games'**
  String get paid_fighting_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Horror Games'**
  String get paid_horror_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Multiplayer Games'**
  String get paid_multiplayer_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid New Releases'**
  String get paid_new_releases_subtitle;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid New Releases'**
  String get paid_new_releases_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Open World Games'**
  String get paid_open_world_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Pixel Art Games'**
  String get paid_pixel_art_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Post Apocalyptic Games'**
  String get paid_post_apocalyptic_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Pvp Games'**
  String get paid_pvp_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Racing Games'**
  String get paid_racing_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Relaxing Games'**
  String get paid_relaxing_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Retro Games'**
  String get paid_retro_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Roguelike Games'**
  String get paid_roguelike_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Rpg Games'**
  String get paid_rpg_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Shooter Games'**
  String get paid_shooter_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Simulation Games'**
  String get paid_simulation_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Sports Games'**
  String get paid_sports_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Steampunk Games'**
  String get paid_steampunk_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Story Rich Games'**
  String get paid_story_rich_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Strategy Games'**
  String get paid_strategy_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Survival Games'**
  String get paid_survival_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Top Rated Games'**
  String get paid_top_rated_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Turn Based Games'**
  String get paid_turn_based_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Paid Vr Games'**
  String get paid_vr_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Pixel Art Games'**
  String get pixel_art_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Post Apocalyptic Games'**
  String get post_apocalyptic_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Puzzle Games'**
  String get puzzle_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Pve Games'**
  String get pve_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Pvp Games'**
  String get pvp_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Racing Games'**
  String get racing_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Relaxing Games'**
  String get relaxing_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Retro Games'**
  String get retro_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Roguelike Games'**
  String get roguelike_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Rpg Games'**
  String get rpg_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Shooter Games'**
  String get shooter_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Simulation Games'**
  String get simulation_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Sports Games'**
  String get sports_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Steampunk Games'**
  String get steampunk_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Story Rich Games'**
  String get story_rich_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Strategy Games'**
  String get strategy_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Survival Games'**
  String get survival_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Top Rated Games'**
  String get top_rated_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Turn Based Games'**
  String get turn_based_games_title;

  /// Section title/subtitle from config key
  ///
  /// In en, this message translates to:
  /// **'Vr Games'**
  String get vr_games_title;
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
