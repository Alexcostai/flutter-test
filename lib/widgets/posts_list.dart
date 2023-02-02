import 'package:flutter/material.dart';
import 'package:fluttertest/models/post.dart';

class PostsList extends StatefulWidget {
  final List<Post> listItems;
  const PostsList({super.key, required this.listItems});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(post.body),
                subtitle: Text(post.author),
              )),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      post.likes.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () => like(post.likePost),
                      icon: Icon(
                        Icons.thumb_up,
                        color:
                            post.userLiked ? Colors.blueAccent : Colors.black,
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
