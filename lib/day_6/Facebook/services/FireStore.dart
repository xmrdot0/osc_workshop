import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:osc_workshop/day_6/Facebook/Models/Account.dart';
import 'package:osc_workshop/day_6/Facebook/Models/PostModel.dart';

class Database {
  CollectionReference AccountsRef =
      FirebaseFirestore.instance.collection("Accounts");
  CollectionReference PostsRef = FirebaseFirestore.instance.collection("Posts");

  SaveAccount(AccountModel acc) async {
    await AccountsRef.doc(acc.username).set(acc.toMap());
  }

  SavePost(PostModel post) async {
    await PostsRef.doc().set(post.toMap());
  }

  getPosts() async {
    return await PostsRef.snapshots();
  }

  updateLike(PostModel post) {
    PostsRef.doc(post.postID)
        .update({'liked': post.liked, 'NumOfLikes': post.NumOfLikes});
  }
}
