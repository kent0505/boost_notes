import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/note_repository.dart';
import '../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _repository;

  NoteBloc({required NoteRepository repository})
      : _repository = repository,
        super(NoteState()) {
    on<NoteEvent>(
      (event, emit) => switch (event) {
        LoadNotes() => _loadNotes(event, emit),
      },
    );
  }

  void _loadNotes(
    LoadNotes event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final notes = await _repository.loadNotes();

      emit(state.copyWith(
        notes: notes,
        loading: false,
      ));
    } catch (e) {
      logger('Error loading notes: $e');

      emit(state.copyWith(loading: false));
    }
  }
}
