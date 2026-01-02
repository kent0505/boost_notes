import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _repository;

  ChatBloc({required ChatRepository repository})
      : _repository = repository,
        super(ChatState()) {
    on<ChatEvent>(
      (event, emit) => switch (event) {
        SendMessage() => _sendMessage(event, emit),
      },
    );
  }

  void _sendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    logger(_repository.hashCode);
  }
}
