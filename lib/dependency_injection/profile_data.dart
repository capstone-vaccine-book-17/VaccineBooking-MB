class ProfileData {
  String? fullName;
  String? nik;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? image;

  AddressData? address;

  ProfileData({
    this.fullName,
    this.nik,
    this.gender,
    this.dateOfBirth,
    this.image,
    this.email,
    this.address,
  });
}

class AddressData {
  String? address;
  String? province;
  String? city;
  String? postalCode;

  AddressData({
    this.address,
    this.province,
    this.city,
    this.postalCode,
  });
}
