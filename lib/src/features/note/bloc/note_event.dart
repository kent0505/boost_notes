part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

final class LoadNotes extends NoteEvent {}
