class DataProfile {
  final List<Profile> data;
  DataProfile({required this.data});

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        data: List.from(json['data'].map((user) => Profile.fromMode(user))),
      );
}

class Profile {
  final String id;
  final String nik;
  final String name;
  final String mail;
  final String avatar;

  Profile(
      {required this.id,
      required this.nik,
      required this.name,
      required this.mail,
      required this.avatar});

  factory Profile.fromMode(Map<String, dynamic> json) => Profile(
      id: json['id'],
      nik: json['nik'],
      name: json['name'],
      mail: json['mail'],
      avatar: json['avatar']);

}
