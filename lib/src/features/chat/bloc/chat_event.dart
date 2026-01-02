part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

final class SendMessage extends ChatEvent {
  SendMessage({required this.message});

  final String message;
}
