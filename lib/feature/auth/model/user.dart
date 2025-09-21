class User {
  User({required this.id, required this.phone});

  factory User.fromJson(Map<String, dynamic> map) =>
      User(id: map['id'], phone: map['phone']);

  Map<String, dynamic> toJson() => {'id': id, 'phone': phone};

  final String id, phone;

  @override
  String toString() => 'User(id: $id,  phone: $phone)';
}
