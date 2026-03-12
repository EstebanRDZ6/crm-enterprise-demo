enum ClientStatus {
  active('Active', 'Activo'),
  inactive('Inactive', 'Inactivo'),
  prospect('Prospect', 'Prospecto');

  final String enLabel;
  final String esLabel;

  const ClientStatus(this.enLabel, this.esLabel);
}

class Interaction {
  final DateTime date;
  final String note;
  final String type; // email, call, meeting

  Interaction({required this.date, required this.note, required this.type});
}

class Client {
  final String id;
  final String name;
  final String company;
  final String email;
  final String phone;
  final ClientStatus status;
  final List<Interaction> interactions;

  Client({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.status,
    required this.interactions,
  });
}
