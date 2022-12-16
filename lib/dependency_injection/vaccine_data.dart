class VaccineData {
  int? medicalFacilitysId;
  String? name;
  String? image;
  String? address;
  String? province;
  String? city;
  String? dosis;

  VaccineData({
    this.medicalFacilitysId,
    this.name,
    this.image,
    this.address,
    this.province,
    this.city,
    this.dosis,
  });

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
    final Map<String, dynamic> vaccineData = <String, dynamic>{};
    vaccineData['medical_facilitys_id'] = medicalFacilitysId;
    vaccineData['name'] = name;
    vaccineData['image'] = image;
    vaccineData['address'] = address;
    vaccineData['province'] = province;
    vaccineData['city'] = city;
    vaccineData['dosis'] = dosis;
    return vaccineData;
  }
}
