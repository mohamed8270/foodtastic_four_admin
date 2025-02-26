class UserRegisterModel {
  final String id;
  final String employeeId;
  final int counterId;
  final String fullName;
  final String email;

  UserRegisterModel({required this.id, required this.employeeId, required this.counterId, required this.fullName, required this.email});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        id: json['_id'],
        employeeId: json['employeeId'],
        counterId: json['counterId'],
        fullName: json['fullName'],
        email: json['email'],
  );
}