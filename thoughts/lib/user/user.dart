import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/constants/firebase_data_keys.dart';
import 'package:thoughts/widgets/user_default_image.dart';

class User extends Equatable {
  String userName;
  Image profileImage = UserDefaultImage();
  String description;

  @override
  List<Object> get props => [];

  User({
    this.userName,
    this.profileImage,
    this.description,
  });

  User.fromDictionary(Map<String, dynamic> userDictionary) {
    userName = userDictionary[FirebaseDataKeys.userName];
    description = userDictionary[FirebaseDataKeys.description];
  }
}
