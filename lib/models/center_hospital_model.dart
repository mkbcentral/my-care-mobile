class CenterHospital {
  int? id;
  String? name;
  String? centerPhone;
  String? municipality;
  String? street;
  String? numberStreet;
  String? city;
  CenterHospital({
    this.id,
    this.name,
    this.centerPhone,
    this.municipality,
    this.street,
    this.numberStreet,
    this.city
  });

  factory CenterHospital.fromJson(Map<String, dynamic> json) {
    return CenterHospital(
      id: json['id'],
      name: json['name'],
      centerPhone: json['center_phone'],
      municipality: json['municipality'],
      street: json['street'],
      numberStreet: json['number_street'],
      city: json['city']['name'],
    );
  }
}
