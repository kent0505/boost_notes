part of 'chat_bloc.dart';

final class ChatState {
  final bool loading;

  ChatState({
    this.loading = false,
  });

  ChatState copyWith({
    bool? loading,
  }) {
    return ChatState(
      loading: loading ?? this.loading,
    );
  }
}
