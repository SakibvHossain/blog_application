import 'dart:convert';

import 'package:blog_application/post/data/model/blog_model.dart';
import 'package:blog_application/utils/api_service/implementation/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController{
  var posts = <BlogPost>[].obs; // Observable list
  late Box<BlogPost> blogBox;

  RxBool isLoading = false.obs;
  late HttpServiceImpl httpServiceImpl;

  @override
  void onInit() {
    httpServiceImpl = HttpServiceImpl();
    blogBox = Hive.box<BlogPost>('blogs');
    super.onInit();
    // Always fetch fresh data from the API
    fetchProductsFromApi();
  }


  void loadProductFromHive(){
    posts.value = blogBox.values.toList();
  }

  void fetchProductsFromApi() async {
    try {
      isLoading(true);
      http.Response response = await httpServiceImpl.getPost();
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        final List<dynamic> blogContent = decodeResponse['data']['content'];
        // Convert API response to BlogPost objects
        final fetchedBlogs = blogContent.map((item) => BlogPost.fromJson(item)).toList();

        // Clear the Hive box to ensure it's updated with fresh data
        await blogBox.clear();

        // Save each blog to Hive
        for (var blog in fetchedBlogs) {
          blogBox.put(blog.postId, blog);
        }

        // Update observable list
        posts.value = fetchedBlogs;
        print('Blogs retrieved and updated successfully: $posts');
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }

}