import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_lecture4/components/post_list.dart';
import 'package:flutter_lecture4/post.dart';
import 'package:http/http.dart';

class Home extends StatelessWidget {
  static const routeName = "/";

  const Home({Key? key}) : super(key: key);

  //Build methods can not make as Async

  Future<List<Post>?> getDataFromAPI() async {
    final res =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (res.statusCode == 200) {
      List<Post> posts = jsonDecode(res.body).map<Post>((data) {
        return Post.fromJSON(data);
      }).toList();
      print('123');
      return posts;
    }else{
      print('null');
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Data"),
      ),
      body: FutureBuilder<List<Post>?>(
        future: getDataFromAPI(),
        builder: (context, snapshot) {
          if(snapshot.hasError){

            return const Center(
              child: Text('Error'),
            );
          }
          else if (snapshot.hasData) {
            //Create our own list component
            List<Post>? posts = snapshot.data;
            return posts != null ? PostList(posts: posts) : Text('Empty');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
