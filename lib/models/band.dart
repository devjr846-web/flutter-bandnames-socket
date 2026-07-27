class Band {
  String id;
  String name;
  int votes = 0;

  Band({required this.id, required this.name, this.votes = 0});

  factory Band.fromMap(Map<String, dynamic> map) {
    return Band(id: map['id'], name: map['name'], votes: map['votes'] ?? 0);
  }
}
