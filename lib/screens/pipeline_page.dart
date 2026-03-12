import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_crm/data/mock_data.dart';
import 'package:demo_crm/models/opportunity.dart';
import 'package:demo_crm/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class PipelinePage extends StatelessWidget {
  const PipelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mockData = Provider.of<MockData>(context);
    final loc = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.translate('pipeline'),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: PipelineStage.values.map((stage) {
                  final relatedOpps = mockData.opportunities
                      .where((o) => o.stage == stage)
                      .toList();

                  final stageHeader = localeCode == 'es'
                      ? stage.esLabel
                      : stage.enLabel;

                  return _PipelineColumn(
                    stageHeader: stageHeader,
                    opportunities: relatedOpps,
                    stage: stage,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PipelineColumn extends StatelessWidget {
  final String stageHeader;
  final List<Opportunity> opportunities;
  final PipelineStage stage;

  const _PipelineColumn({
    required this.stageHeader,
    required this.opportunities,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stageHeader.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    opportunities.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: opportunities.length,
              itemBuilder: (context, index) {
                final opp = opportunities[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Draggable<String>(
                    data: opp.id,
                    feedback: Material(
                      elevation: 8,
                      child: SizedBox(
                        width: 290,
                        child: _OpportunityCard(opp: opp),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.5,
                      child: _OpportunityCard(opp: opp),
                    ),
                    child: _OpportunityCard(opp: opp),
                  ),
                );
              },
            ),
          ),
          DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                  color: candidateData.isNotEmpty
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: candidateData.isNotEmpty
                      ? const Icon(Icons.download, color: Colors.blue)
                      : const SizedBox.shrink(),
                ),
              );
            },
            onAccept: (data) {
              Provider.of<MockData>(
                context,
                listen: false,
              ).updateOpportunityStage(data, stage);
            },
          ),
        ],
      ),
    );
  }
}

class _OpportunityCard extends StatelessWidget {
  final Opportunity opp;

  const _OpportunityCard({required this.opp});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              opp.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              opp.clientName,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currencyFormat.format(opp.amount),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getProbabilityColor(
                      opp.probability,
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${(opp.probability * 100).toInt()}%',
                    style: TextStyle(
                      color: _getProbabilityColor(opp.probability),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getProbabilityColor(double prob) {
    if (prob >= 0.7) return Colors.green;
    if (prob >= 0.4) return Colors.orange;
    return Colors.red;
  }
}
