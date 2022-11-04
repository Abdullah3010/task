import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/core/api/api_endpoints.dart';
import 'package:jop_task/core/errors/errors_exceptions.dart';
import 'package:jop_task/core/user/current_user.dart';
import 'package:jop_task/features/gallery/data/models/gallery_model.dart';

abstract class GalleryRemoteDateSource {
  Future<Unit> uploadImage({XFile? image});
  Future<GalleryModel> getImages();
}

class GalleryRemoteImpWithHttp extends GalleryRemoteDateSource {
  @override
  Future<Unit> uploadImage({XFile? image}) async {

    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(
        ApiEndpoints.BASE_URL + ApiEndpoints.UPLOADE_IMAGE,
      ),
    );
    request.headers.addAll(<String, String>{
      'Authorization': 'Bearer ${CurrentUser.getToken()}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (image != null) {
      File file = File(image.path);
      request.files.add(
        http.MultipartFile(
          'img',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        ),
      );
    }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GalleryModel> getImages() async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.BASE_URL + ApiEndpoints.GET_IMAGES),
        headers: {
          'Authorization': 'Bearer ${CurrentUser.getToken()}',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return GalleryModel.fromJson(jsonResponse);
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw ServerException();
    }
  }
}
