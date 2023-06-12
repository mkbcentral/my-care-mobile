class Hospital {
  int? id;
  String? name;
  String? abbreviation;
  String? logo;
  String? country;
  String? email;
  Hospital({
    this.id,
    this.name,
    this.logo,
    this.country,
    this.email
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      country: json['country'],
      email: json['email'],
    );
  }
}
