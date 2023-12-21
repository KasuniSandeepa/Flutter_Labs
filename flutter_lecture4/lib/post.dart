class Post{
  final String id;
  final String title;
  final String body;

  const Post({ required this.id, required this.body , required this.title});

  //JSON will look like a map inside dart
  factory Post.fromJSON(Map data){
    return Post(id: data['id'], body: data['body'], title: data['title']);

  }
}