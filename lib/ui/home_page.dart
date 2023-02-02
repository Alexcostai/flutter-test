import 'package:flutter/material.dart';
//project imports
import 'package:fluttertest/models/post.dart';
import 'package:fluttertest/widgets/posts_list.dart';
import 'package:fluttertest/widgets/text_input.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Custom Title')),
        body: Column(
          children: <Widget>[
            Expanded(child: PostsList(listItems: posts)),
            TextInputWidget(
              callback: newPost,
            )
          ],
        ));
  }
}
