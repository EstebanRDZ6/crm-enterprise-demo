import 'package:flutter/material.dart';
import 'package:demo_crm/models/client.dart';
import 'package:demo_crm/models/opportunity.dart';

class MockData extends ChangeNotifier {
  List<Client> clients = [
    Client(
      id: '1',
      name: 'Maria Garcia',
      company: 'Tech Solutions SA',
      email: 'maria@techsa.com',
      phone: '+34 600 123 456',
      status: ClientStatus.active,
      interactions: [
        Interaction(
          date: DateTime.now().subtract(const Duration(days: 2)),
          note: 'Called to follow up',
          type: 'call',
        ),
      ],
    ),
    Client(
      id: '2',
      name: 'John Smith',
      company: 'Global Enterprises',
      email: 'jsmith@globalent.com',
      phone: '+1 555 0192',
      status: ClientStatus.prospect,
      interactions: [
        Interaction(
          date: DateTime.now().subtract(const Duration(days: 5)),
          note: 'Sent proposal email',
          type: 'email',
        ),
      ],
    ),
  ];

  List<Opportunity> opportunities = [
    Opportunity(
      id: 'opp1',
      clientId: '1',
      clientName: 'Maria Garcia',
      title: 'ERP Integration',
      amount: 15000.0,
      probability: 0.8,
      expectedCloseDate: DateTime.now().add(const Duration(days: 30)),
      stage: PipelineStage.negotiation,
      responsible: 'Alex Seller',
    ),
    Opportunity(
      id: 'opp2',
      clientId: '2',
      clientName: 'John Smith',
      title: 'Cloud Migration',
      amount: 25000.0,
      probability: 0.4,
      expectedCloseDate: DateTime.now().add(const Duration(days: 60)),
      stage: PipelineStage.proposal,
      responsible: 'Alex Seller',
    ),
    Opportunity(
      id: 'opp3',
      clientId: '3',
      clientName: 'Sarah Connor',
      title: 'Software Licenses',
      amount: 5000.0,
      probability: 0.1,
      expectedCloseDate: DateTime.now().add(const Duration(days: 15)),
      stage: PipelineStage.lead,
      responsible: 'Maria Rep',
    ),
  ];

  void updateOpportunityStage(String id, PipelineStage newStage) {
    final index = opportunities.indexWhere((o) => o.id == id);
    if (index != -1) {
      opportunities[index] = opportunities[index].copyWith(stage: newStage);
      notifyListeners();
    }
  }

  double get totalSalesThisMonth => opportunities
      .where((o) => o.stage == PipelineStage.closed)
      .fold(0.0, (sum, item) => sum + item.amount);

  int get activeOpportunities =>
      opportunities.where((o) => o.stage != PipelineStage.closed).length;

  int get totalClients => clients.length;
}
