class UserRolePermissionModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UserRolePermissionModel(
      {this.success, this.statusCode, this.message, this.data, });

  UserRolePermissionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? userId;
  String? username;
  String? roleName;
  List<String>? permissions;

  Data({this.userId, this.username, this.roleName, this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    roleName = json['role_name'];
    permissions = json['permissions'].cast<String>();
  }

}
