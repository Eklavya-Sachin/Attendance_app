import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String rollNumber;
  final String userGrade;
  final String attendance;

  UserModel({
    required this.userName,
    required this.rollNumber,
    required this.userGrade,
    required this.attendance,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_name": userName,
      "roll_number": rollNumber,
      "user_grade": userGrade,
      "attendance": attendance,
      "date_time": DateTime.now().millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot documentSnapshot) =>
      UserModel(
        userName: documentSnapshot.get('user_name'),
        rollNumber: documentSnapshot.get('roll_number'),
        userGrade: documentSnapshot.get('user_grade'),
        attendance: documentSnapshot.get('attendance'),
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['user_name'],
        rollNumber: json['roll_number'],
        userGrade: json['user_grade'],
        attendance: json['attendance'],
      );
}
