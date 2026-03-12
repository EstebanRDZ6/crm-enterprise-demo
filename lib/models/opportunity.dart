enum PipelineStage {
  lead('Lead', 'Lead'),
  contacted('Contacted', 'Contactado'),
  proposal('Proposal', 'Propuesta'),
  negotiation('Negotiation', 'Negociación'),
  closed('Closed', 'Cerrado');

  final String enLabel;
  final String esLabel;

  const PipelineStage(this.enLabel, this.esLabel);
}

class Opportunity {
  final String id;
  final String clientId;
  final String clientName;
  final String title;
  final double amount;
  final double probability; // 0.0 - 1.0
  final DateTime expectedCloseDate;
  final PipelineStage stage;
  final String responsible;

  Opportunity({
    required this.id,
    required this.clientId,
    required this.clientName,
    required this.title,
    required this.amount,
    required this.probability,
    required this.expectedCloseDate,
    required this.stage,
    required this.responsible,
  });

  Opportunity copyWith({PipelineStage? stage}) {
    return Opportunity(
      id: id,
      clientId: clientId,
      clientName: clientName,
      title: title,
      amount: amount,
      probability: probability,
      expectedCloseDate: expectedCloseDate,
      stage: stage ?? this.stage,
      responsible: responsible,
    );
  }
}
