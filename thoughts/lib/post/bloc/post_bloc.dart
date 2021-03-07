import 'package:bloc/bloc.dart';
import 'package:thoughts/post/bloc/post_events.dart';
import 'package:thoughts/post/bloc/post_states.dart';
import 'package:thoughts/post/post.dart';
import 'package:thoughts/post/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc({PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (event is AllPosts) {
      posts = await _postRepository.fetchAllPosts();
    }

    if (posts.isNotEmpty) {
      yield PostSuccess(posts);
    }

    // throw UnimplementedError();
  }
}
