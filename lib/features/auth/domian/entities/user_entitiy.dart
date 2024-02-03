import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userID;
  final String userBio;
  final String userEmail;
  final String userImgUrl;
  final String username;

  UserEntity({required this.userID, required this.userBio, required this.userEmail, required this.userImgUrl, required this.username});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userID,userBio,userEmail,userImgUrl,username];

  
}
