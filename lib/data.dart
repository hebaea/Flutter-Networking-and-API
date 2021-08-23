class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  Data({this.id, this.email, this.firstName, this.lastName});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name']);
  }
}
