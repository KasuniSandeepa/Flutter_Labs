import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {

  static const routeName = "/addPost";
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Form(
        key: _formKey, // Use key to manipulate data and access data, and access kind of functions inside this Form widget, Can access fields in the form
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Please Enter the title";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Form is submitted")),
                );
              }
            }, child: Text('Submit'))
          ],
        ),
      )
    );
  }
}
