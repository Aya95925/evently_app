class UserDm {
  static UserDm? currentUser;
  final String id;
  final String name;
  final String password;
  final String phoneNumber;
  final String address;
  final String email;
  final List? isFavourite;

  UserDm({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    this.isFavourite = const [],
    required this.phoneNumber,
    required this.address,
  });
}
