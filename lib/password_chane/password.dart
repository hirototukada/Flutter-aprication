class Password {
  int id;
  String name;
  String userId;
  String password;

  Password(
      {this.id = 0,
      required this.name,
      required this.userId,
      required this.password});
}
