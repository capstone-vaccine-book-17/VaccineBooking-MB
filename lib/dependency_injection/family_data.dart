class FamilyMember {
  int id;
  String name;
  String nik;
  int age;
  String gender;
  String relationship;

  FamilyMember({
    required this.id,
    required this.name,
    required this.nik,
    required this.age,
    required this.gender,
    required this.relationship,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      id: json['family_id'],
      name: json['name'],
      nik: json['nik'],
      age: json['age'],
      gender: json['gender'],
      relationship: json['relation'],
    );
  }
}

class FamilyData {
  List<FamilyMember> family = [];
}
