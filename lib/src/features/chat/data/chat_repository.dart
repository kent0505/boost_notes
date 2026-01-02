import 'package:dio/dio.dart';

import '../../../core/utils.dart';

abstract interface class ChatRepository {
  const ChatRepository();

  Future<void> sendMessage();
}

final class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> sendMessage() async {
    logger(_dio.hashCode);
  }
}
