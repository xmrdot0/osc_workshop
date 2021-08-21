class Account {
  int? accountNum;
  double amount;
  String name;
  String password;
  String username;

  Account(
      {this.accountNum,
      required this.username,
      required this.password,
      required this.name,
      this.amount: 0.0});
}
