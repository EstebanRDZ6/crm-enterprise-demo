import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_crm/widgets/app_shell.dart';
import 'package:demo_crm/data/mock_data.dart';
import 'package:demo_crm/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => MockData()),
      ],
      child: const CRMDemoApp(),
    ),
  );
}

class AppState extends ChangeNotifier {
  Locale _locale = const Locale('es');
  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }
}

class CRMDemoApp extends StatelessWidget {
  const CRMDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'CRM Demo Profesional',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: ThemeMode.system,
          locale: appState.locale,
          supportedLocales: const [Locale('en'), Locale('es')],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const AppShell(),
        );
      },
    );
  }
}
