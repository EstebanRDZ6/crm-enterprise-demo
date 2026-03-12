import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_crm/main.dart';
import 'package:demo_crm/l10n/app_localizations.dart';
import 'package:demo_crm/screens/home_dashboard_page.dart';
import 'package:demo_crm/screens/clients_page.dart';
import 'package:demo_crm/screens/pipeline_page.dart';
import 'package:demo_crm/screens/analytics_page.dart';
import 'package:demo_crm/screens/about_crm_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  AppShellState createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeDashboardPage(),
    const ClientsPage(),
    const PipelinePage(),
    const AnalyticsPage(),
    const AboutCrmPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final loc = AppLocalizations.of(context)!;

    // Web/Desktop responsive layout
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enterprise CRM Demo'),
        actions: [
          DropdownButton<Locale>(
            value: appState.locale,
            icon: const Icon(Icons.language),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                appState.setLocale(newLocale);
              }
            },
            items: const [
              DropdownMenuItem(value: Locale('en'), child: Text('English')),
              DropdownMenuItem(value: Locale('es'), child: Text('Español')),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.dashboard_outlined),
                  selectedIcon: const Icon(Icons.dashboard),
                  label: Text(loc.translate('dashboard')),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.people_outline),
                  selectedIcon: const Icon(Icons.people),
                  label: Text(loc.translate('clients')),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.view_kanban_outlined),
                  selectedIcon: const Icon(Icons.view_kanban),
                  label: Text(loc.translate('pipeline')),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.analytics_outlined),
                  selectedIcon: const Icon(Icons.analytics),
                  label: Text(loc.translate('analytics')),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.info_outline),
                  selectedIcon: const Icon(Icons.info),
                  label: Text(loc.translate('about_crm')),
                ),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.dashboard_outlined),
                  selectedIcon: const Icon(Icons.dashboard),
                  label: loc.translate('dashboard'),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.people_outlined),
                  selectedIcon: const Icon(Icons.people),
                  label: loc.translate('clients'),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.view_kanban_outlined),
                  selectedIcon: const Icon(Icons.view_kanban),
                  label: loc.translate('pipeline'),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.analytics_outlined),
                  selectedIcon: const Icon(Icons.analytics),
                  label: loc.translate('analytics'),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.info_outline),
                  selectedIcon: const Icon(Icons.info),
                  label: loc.translate('about_crm'),
                ),
              ],
            ),
    );
  }
}
