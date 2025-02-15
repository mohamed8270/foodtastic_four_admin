class UserRegisterModel {
  final String employeeId;
  final int counterId;
  final String fullName;
  final String email;
  final String password;

  UserRegisterModel({required this.employeeId, required this.counterId, required this.fullName, required this.email, required this.password});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
        employeeId: json['employeeId'],
        counterId: json['counterId'],
        fullName: json['fullName'],
        email: json['email'],
        password: json['password']);
  }
}