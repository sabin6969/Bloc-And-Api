part of 'post_bloc.dart';

sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<Posts> postData;
  PostLoadedState({required this.postData});
}

final class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
}
