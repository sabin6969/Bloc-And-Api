import 'dart:async';
import 'dart:io';

import 'package:api_bloc/model/post_model.dart';
import 'package:api_bloc/repository/post_repository.dart';
import 'package:bloc/bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostApiRepository _postApiRepository = PostApiRepository();
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      try {
        emit(PostLoadingState());
        List<Posts> data = await _postApiRepository.getPostApi();
        emit(PostLoadedState(postData: data));
      } on TimeoutException {
        emit(PostErrorState(message: "Network request timeout"));
      } on SocketException {
        emit(PostErrorState(message: "Error communication with server"));
      }
    });
  }
}
