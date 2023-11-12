import 'app_localizations.dart';

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get today => 'Today';

  @override
  String get cloudy => 'Cloudy';

  @override
  String get wind => 'Wind';

  @override
  String get hum => 'Hum';

  @override
  String windSpeed(int speed) {
    return '$speed km/h';
  }

  @override
  String get forecastReport => 'Forecast report';

  @override
  String get searchHere => 'Search here';

  @override
  String get recentSearch => 'Recent search';

  @override
  String get back => 'Back';

  @override
  String get nextForecast => 'Next Forecast';
}
