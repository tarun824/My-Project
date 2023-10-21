class UserModel {
  final String userId;
  final String name;
  final String emailId;

  double balance;

  UserModel({
    required this.userId,
    required this.name,
    required this.emailId,
    required this.balance,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      name: json['name'],
      emailId: json['emailId'],
      balance: json['balance'],
    );
  }
}
