import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

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
