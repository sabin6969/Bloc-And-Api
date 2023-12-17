import 'package:api_bloc/pages/posts_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("API Call"),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostsPage(),
                  ),
                );
              },
              child: const Text("Get posts"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Get photos"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Get users data"),
            )
          ],
        ),
      ),
    );
  }
}
