import 'package:api_bloc/blocs/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBloc _postBloc = PostBloc();
  @override
  void initState() {
    _postBloc.add(GetPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: _postBloc,
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            if (state.postData.isEmpty) {
              return const Center(
                child: Text("No data to show"),
              );
            } else {
              return ListView.builder(
                itemCount: state.postData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.postData[index].title.toString(),
                    ),
                    subtitle: Text(
                      state.postData[index].body.toString(),
                    ),
                    leading: Text(
                      state.postData[index].userId.toString(),
                    ),
                    trailing: Text(
                      state.postData[index].id.toString(),
                    ),
                  );
                },
              );
            }
          } else if (state is PostErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text("An unknown error occured"),
            );
          }
        },
      ),
    );
  }
}
