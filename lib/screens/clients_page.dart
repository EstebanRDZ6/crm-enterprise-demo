import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_crm/data/mock_data.dart';
import 'package:demo_crm/models/client.dart';
import 'package:demo_crm/l10n/app_localizations.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mockData = Provider.of<MockData>(context);
    final loc = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.translate('clients'),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: mockData.clients.length,
                itemBuilder: (context, index) {
                  final client = mockData.clients[index];
                  final statusLabel = localeCode == 'es'
                      ? client.status.esLabel
                      : client.status.enLabel;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        child: Text(client.name[0]),
                      ),
                      title: Text(
                        client.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${client.company} - ${client.email}'),
                      trailing: Chip(
                        label: Text(statusLabel),
                        backgroundColor: _getStatusColor(
                          client.status,
                        ).withOpacity(0.1),
                        labelStyle: TextStyle(
                          color: _getStatusColor(client.status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(ClientStatus status) {
    switch (status) {
      case ClientStatus.active:
        return Colors.green;
      case ClientStatus.prospect:
        return Colors.orange;
      case ClientStatus.inactive:
        return Colors.grey;
    }
  }
}
