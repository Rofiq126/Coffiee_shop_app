class UserData {
  String name;
  String email;
  String phone;
  String password;

  UserData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  UserData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'];

  userDataToJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
