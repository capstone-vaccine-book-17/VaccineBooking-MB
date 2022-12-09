class FamilyMember {
  String name;
  String nik;
  String age;
  String gender;
  String relationship;

  FamilyMember({
    required this.name,
    required this.nik,
    required this.age,
    required this.gender,
    required this.relationship,
  });
}

class FamilyData {
  List<FamilyMember> family = [];
}
