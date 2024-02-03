import 'package:ChattyPal/core/constants/user_model_constants/user_model_conostants.dart';
import 'package:ChattyPal/features/auth/domian/entities/user_entitiy.dart';

class UserModel extends UserEntity {
  UserModel({required super.userID, required super.userBio, required super.userEmail, required super.userImgUrl, required super.username});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        userID: jsonData[USERID],
        userBio: jsonData[USERBIO],
        userEmail: jsonData[USEREMAIL],
        userImgUrl: jsonData[USERIMGURL],
        username: jsonData[USERNAME]);
  }

  Map<String, dynamic> toJson() {
    return {
      USERID:userID,
      USERBIO:userBio,
      USEREMAIL:userEmail,
      USERIMGURL:userImgUrl,
      USERNAME:username
    };
  }
}
