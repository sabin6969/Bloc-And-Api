import 'package:api_bloc/services/posts_api_services.dart';

class PostApiRepository {
  final PostApiService _postApiService = PostApiService();

  getPostApi() async {
    return await _postApiService.getPostData();
  }
}
