import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'dashboard': 'Dashboard',
      'clients': 'Clients',
      'pipeline': 'Pipeline',
      'analytics': 'Analytics',
      'about_crm': 'What is a CRM?',
      'benefits': 'Benefits',
      'sales': 'Sales',
      'active_opportunities': 'Active Opportunities',
      'total_clients': 'Total Clients',
      'sales_of_month': 'Sales of the Month',
      'language': 'Language',
      'new_client': 'New Client',
      'search': 'Search...',
      'status': 'Status',
      'opportunities': 'Opportunities',
    },
    'es': {
      'dashboard': 'Panel Principal',
      'clients': 'Clientes',
      'pipeline': 'Pipeline',
      'analytics': 'Métricas',
      'about_crm': '¿Qué es un CRM?',
      'benefits': 'Beneficios',
      'sales': 'Ventas',
      'active_opportunities': 'Oportunidades Activas',
      'total_clients': 'Clientes Totales',
      'sales_of_month': 'Ventas del Mes',
      'language': 'Idioma',
      'new_client': 'Nuevo Cliente',
      'search': 'Buscar...',
      'status': 'Estado',
      'opportunities': 'Oportunidades',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
