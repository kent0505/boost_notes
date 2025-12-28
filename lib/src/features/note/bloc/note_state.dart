part of 'note_bloc.dart';

final class NoteState {
  NoteState({
    this.notes = const [],
    this.loading = false,
  });

  final List<Note> notes;
  final bool loading;

  NoteState copyWith({
    List<Note>? notes,
    bool? loading,
  }) {
    return NoteState(
      notes: notes ?? this.notes,
      loading: loading ?? this.loading,
    );
  }
}
