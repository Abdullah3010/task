import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jop_task/core/api/api_endpoints.dart';
import 'package:jop_task/core/errors/errors_exceptions.dart';
import 'package:jop_task/core/user/current_user.dart';
import 'package:jop_task/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDateSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<Unit> logout();
}

class AuthRemoteImpWithHttp extends AuthRemoteDateSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.BASE_URL + ApiEndpoints.LOGIN),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        CurrentUser.setToken(jsonResponse['token']);
        return UserModel.fromJson(jsonResponse['user']);
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

  @override
  Future<Unit> logout() async {
    CurrentUser.clear();
    return unit;
  }


  
}
