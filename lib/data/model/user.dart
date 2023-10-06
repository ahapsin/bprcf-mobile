class DataUser {
  final List<User> data;
  DataUser({required this.data});

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        data: List.from(json['data'].map((user) => User.fromMode(user))),
      );
}

class User {
  final String id;
  final String nik;
  final String name;
  final String mail;
  final String avatar;

  User(
      {required this.id,
      required this.nik,
      required this.name,
      required this.mail,
      required this.avatar});

  factory User.fromMode(Map<String, dynamic> json) => User(
        id: json['id'],
        nik: json['nik'],
        name: json['name'],
        mail: json['mail'],
        avatar: json['avatar']
      );
}
