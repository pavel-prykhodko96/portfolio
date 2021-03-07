import 'package:equatable/equatable.dart';
import 'package:thoughts/post/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {
  PostInitial();
}

class PostSuccess extends PostState {
  final List<Post> posts;
  PostSuccess(this.posts);
}
