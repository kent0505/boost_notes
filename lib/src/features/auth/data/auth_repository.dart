import 'package:dio/dio.dart';

import '../../../core/utils.dart';

abstract interface class AuthRepository {
  const AuthRepository();

  Future<void> validateUser();
}

final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> validateUser() async {
    logger(_dio.hashCode);
  }
}
