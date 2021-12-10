class ChangePasswordRequest {
  late String currentPassword;
  late String password;
  late String confirmPassword;

  ChangePasswordRequest(
      {required this.currentPassword,
      required this.password,
      required this.confirmPassword});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_password'] = this.currentPassword;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
