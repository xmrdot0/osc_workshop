import 'package:osc_workshop/day_6/Facebook/services/UserData.dart';

class PostModel {
  String? postID;
  String postContent;
  String Username;
  bool liked;
  int NumOfLikes;

  PostModel(
      {this.postID,
      required this.postContent,
      this.liked: false,
      this.NumOfLikes: 0,
      required this.Username});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> x = {
      "username": UserData.username,
      "content": this.postContent,
      "liked": this.liked,
      "NumOfLikes": this.NumOfLikes
    };
    return x;
  }
}
