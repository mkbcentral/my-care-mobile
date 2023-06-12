class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? role;
  String? accessToken;
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.role,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
        phone: json['user']['phone_number'],
        photo: json['user']['photo'],
        role: json['user']['role'],
        accessToken: json['access_token']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id!;
    data['name'] = name!;
    data['email'] = email!;
    data['photo'] = photo!;
    return data;
  }
}
