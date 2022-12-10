class VaccineData {
  int? medicalFacilitysId;
  String? name;
  String? image;
  String? address;
  String? province;
  String? city;
  String? dosis;

  VaccineData(
      {this.medicalFacilitysId,
      this.name,
      this.image,
      this.address,
      this.province,
      this.city,
      this.dosis});

  VaccineData.fromJson(Map<String, dynamic> json) {
    medicalFacilitysId = json['medical_facilitys_id'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    province = json['province'];
    city = json['city'];
    dosis = json['dosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> VaccineData = Map<String, dynamic>();
    VaccineData['medical_facilitys_id'] = medicalFacilitysId;
    VaccineData['name'] = name;
    VaccineData['image'] = image;
    VaccineData['address'] = address;
    VaccineData['province'] = province;
    VaccineData['city'] = city;
    VaccineData['dosis'] = dosis;
    return VaccineData;
  }
}