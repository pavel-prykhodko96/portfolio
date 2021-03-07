import 'package:equatable/equatable.dart';
import 'package:thoughts/constants/firebase_data_keys.dart';
import 'package:thoughts/user/user.dart';

class Post extends Equatable {
  String userId;
  String text;
  DateTime timeCreated;
  List<String> likes;
  User user;

  @override
  List<Object> get props => [];

  Post({
    this.userId,
    this.text,
    this.timeCreated,
    this.likes,
    this.user,
  });

  Post.fromPostAndUserDictionaries(
    Map<String, dynamic> postDictionary,
    Map<String, dynamic> userDictionary,
  ) {
    userId = postDictionary[FirebaseDataKeys.userId];
    text = postDictionary[FirebaseDataKeys.text];
    // timeCreated = postDictionary[FirebaseDataKeys.timeCreated];
    // likes = postDictionary[FirebaseDataKeys.likes];
    // Implement later
    // user = User.fromDictionary(userDictionary);
  }
}
