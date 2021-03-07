import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thoughts/constants/firebase_data_keys.dart';
import 'package:thoughts/post/post.dart';

class PostRepository {
  final _fetchAmount = 10;
  final _firestore = Firestore.instance;

  Future<List<Post>> fetchAllPosts() async {
    final posts = await _firestore
        .collectionGroup(FirebaseDataKeys.posts)
        .limit(_fetchAmount)
        .getDocuments()
        .then((querySnapshot) {
      return querySnapshot.documents.map((postDocumentSnapshot) {
        // Implement userDictionary later:
        return Post.fromPostAndUserDictionaries(
            postDocumentSnapshot.data, null);
      }).toList();
    });

    return posts;
  }
}

// String userID = postDocumentSnapshot.data[FirebaseDataKeys.userId];
// User user;

// final post = await _firestore
//     .collection(FirebaseDataKeys.users)
//     .document(userID)
//     .get()
//     .then((userDocumentSnapshot) {

// });
