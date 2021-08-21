class Account {
  int? id;
  String? userName;
  String? email;
  String? password;
  Account({this.id, this.userName, this.password, this.email});

  // factory Account.fromMap(Map<String, dynamic> json) =>
  //     new Account(id: json['id'], userName: json['userName']);
}
