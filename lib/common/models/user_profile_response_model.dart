import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel {
    final bool status;
    final String message;
    final UserData data;

    UserProfileResponseModel({
        required this.status,
        required this.message,
        UserData? data
    }) : data = data ?? UserData(username: "username", fullName: "full name", email: "email@gmail.com");

    factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class UserData {
    final String username;
    final String fullName;
    final String email;

    UserData({
        required this.username,
        required this.fullName,
        required this.email,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json["username"],
        fullName: json["full_name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": fullName,
        "email": email,
    };
}
