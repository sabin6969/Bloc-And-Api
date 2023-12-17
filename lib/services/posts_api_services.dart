import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_bloc/model/post_model.dart';
import 'package:http/http.dart';

class PostApiService {
  String endPoint = "https://jsonplaceholder.typicode.com/posts";
  List<Posts> postData = [];
  getPostData() async {
    Response response =
        await get(Uri.parse(endPoint)).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        for (Map<String, dynamic> i in jsonData) {
          postData.add(Posts.fromJson(i));
        }
        return postData;
      } on TimeoutException {
        throw TimeoutException("Network request timeout");
      } on SocketException {
        throw const SocketException("Socket error");
      }
    } else {
      return postData;
    }
  }
}
