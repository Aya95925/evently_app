class UserDm {
  static UserDm? currentUser;
  final String id;
  final String name;
  final String password;
  final String phoneNumber;
  final String address;
  final String email;
  List<String> isFavourite;

  UserDm({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    this.isFavourite = const [],
    required this.phoneNumber,
    required this.address,
  });

  static UserDm fromJson(Map<String, dynamic> json) {
    List<dynamic> favouriteFromJson = json['isFavourite'];
    return UserDm(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phone-number'],
      address: json['address'],
      isFavourite: favouriteFromJson.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'phone-number': phoneNumber,
      'address': address,
      'isFavourite': isFavourite,
    };
  }
}
