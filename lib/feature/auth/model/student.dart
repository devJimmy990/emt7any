import 'package:emt7any/feature/auth/model/school.dart';

enum StudentSection { scientific, literary }

enum StudentGender { male, female }

class Student {
  Student({
    required this.id,
    required this.code,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.school,
    required this.section,
    // required this.birthDate,
    required this.studentId,
    required this.nationalId,
    required this.seatNumber,
    required this.academicYear,
    required this.guardianPhone,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"] as int,
    name: json["name"] as String,
    phone: json["phone"] as String,
    email: json["email"] as String,
    code: json["student_code"] as String,
    studentId: json["student_id"] as int,
    nationalId: json["national_id"] as String,
    seatNumber: json["seat_number"] as String,
    academicYear: json["academic_year"] as String,
    guardianPhone: json["guardian_phone"] as String,
    // birthDate: DateTime.parse(json["birth_date"] as String),
    school: School.fromJson(json["school"] as Map<String, dynamic>),
    gender: StudentGender.values.firstWhere((e) => e.name == json["gender"]),
    section: StudentSection.values.firstWhere((e) => e.name == json["section"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "student_code": code,
    "gender": gender.name,
    "section": section.name,
    "student_id": studentId,
    "national_id": nationalId,
    "school": school.toJson(),
    "seat_number": seatNumber,
    "academic_year": academicYear,
    "guardian_phone": guardianPhone,
    // "birth_date": birthDate.toIso8601String(),
  };

  Map<String, dynamic> toQRJson() => {
    "name": name,
    "student_id": studentId,
    "national_id": nationalId,
  };

  Map<String, dynamic> toDummyJson() => {
    "name": name,
    "student_id": 3,
    "national_id": nationalId,
  };

  final School school;
  final StudentGender gender;
  final StudentSection section;
  // final DateTime birthDate;
  final int id, studentId;
  final String code,
      name,
      phone,
      email,
      nationalId,
      seatNumber,
      academicYear,
      guardianPhone;

  @override
  String toString() => toJson().toString();
}

/**
 *
    "name": "Tarek Hesham Sayed ElFarmawy",
    "email": "tarekelfarmawy@outlook.com",
    "phone": "01010869006",
    "national_id": "12345678909998",
    "user_type": "student",
    "student_code": "studentTest",
    "seat_number": "1010101",
    "academic_year": "first",
    "section": "scientific",
    "birth_date": "1999-05-29T21: 00: 00.000000Z",
    "gender": "male",
    "guardian_phone": "01010869000",
    "is_banned": false,
    "school": {
        "id": 1,
        "name": " مدرسة السعيدية",
        "code": "happySchoolxD",
        "governorate": "الجيزة"
    }
 */
