import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_http_example/MyProvider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<MyProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: userProvider.user.isEmpty?Center(child: CircularProgressIndicator()):
          ListView.builder(
              itemCount: userProvider.user.length,
              itemBuilder: (context,index){
                final post = userProvider.user[index];
                return ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.body!),
                );
              })
    );
  }
}
