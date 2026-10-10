// ignore: unused_import
// ignore_for_file: override_on_non_overriding_member

import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => '👋 Welcome';

  @override
  String get findBest => 'Find the best home services';

  @override
  String get searchHint => 'Search services...';

  @override
  String get categories => 'Categories';

  @override
  String get popularServices => 'Popular Services';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get bookings => 'My Bookings';

  @override
  String get logout => 'Logout';

  @override
  String get cleaning => 'Cleaning';

  @override
  String get plumbing => 'Plumbing';

  @override
  String get electrical => 'Electrical';

  @override
  String get installation => 'Installation';

  @override
  String get findServices => 'Find Services';
  @override
  String get comingSoon =>  'Coming Soon 🚀';
  @override
  String get helpQst =>  'Need help today?';
  @override
  // ignore: override_on_non_overriding_member
  String get bookTrust =>  'Book trusted professionals in just a few taps.';
}
