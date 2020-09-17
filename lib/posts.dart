import 'package:fllutter_http/http_service.dart';
import 'package:fllutter_http/post_detailed.dart';
import 'package:fllutter_http/post_moderl.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: HttpService().getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;

            return ListView(
              children: posts
                  .map(
                    (Post post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text(
                        post.id.toString(),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostDetail(
                          post: post,
                        ),
                      )),
                    ),
                  )
                  .toList(),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
