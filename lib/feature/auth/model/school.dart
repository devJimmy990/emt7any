class School {
  const School({
    required this.name,
    required this.governorate,
    required this.adminstration,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
    name: json["name"],
    governorate: json["governorate"],
    adminstration: "إدراة شرق التعليمية",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "governorate": governorate,
    "adminstration": adminstration,
  };
  final String name, governorate, adminstration;
}
