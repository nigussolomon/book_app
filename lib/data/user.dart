class User {
  final int uid;
  final String firstname;
  final String lastname;
  final String email;
  final String phonenumber;

  User(
      {required this.uid,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phonenumber});

  factory User.fromJson(Map<String, dynamic> Json) {
    return User(
      uid: Json[0],
      firstname: Json['firstname'],
      lastname: Json['lastname'],
      email: Json['email'],
      phonenumber: Json['phonenumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['uid'] = uid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    return data;
  }
}
