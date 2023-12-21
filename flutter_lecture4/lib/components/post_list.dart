import 'package:flutter/material.dart';
import 'package:flutter_lecture4/post.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;
  const PostList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text(posts[index].title),
      );
    });
  }
}
