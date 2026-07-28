class Band {
  String id;
  String name;
  int votes = 0;

  Band({required this.id, required this.name, this.votes = 0});

  factory Band.fromMap(Map<String, dynamic> map) {
    return Band(
      id: map.containsKey('id') ? map['id'] : 'no-id',
      name: map.containsKey('name') ? map['name'] : 'no-name',
      votes: map.containsKey('votes') ? map['votes'] : 0,
    );
  }
}
