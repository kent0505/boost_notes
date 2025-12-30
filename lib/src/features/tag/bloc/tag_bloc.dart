import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/tag_repository.dart';
import '../models/tag.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagRepository _repository;

  TagBloc({required TagRepository repository})
      : _repository = repository,
        super(TagState(tag: allNotes)) {
    on<TagEvent>(
      (event, emit) => switch (event) {
        LoadTags() => _loadTags(event, emit),
        AddTag() => _addTag(event, emit),
        EditTag() => _editTag(event, emit),
        DeleteTag() => _deleteTag(event, emit),
        SelectTag() => _selectTag(event, emit),
      },
    );
  }

  void _loadTags(
    LoadTags event,
    Emitter<TagState> emit,
  ) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
    }

    try {
      final tags = await _repository.loadTags();

      emit(state.copyWith(
        tags: tags,
        loading: false,
      ));
    } catch (e) {
      logger(e);

      emit(state.copyWith(loading: false));
    }
  }

  void _addTag(
    AddTag event,
    Emitter<TagState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      await _repository.addTag(event.tag);

      add(LoadTags());
    } catch (e) {
      logger(e);

      emit(state.copyWith(loading: false));
    }
  }

  void _editTag(
    EditTag event,
    Emitter<TagState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      await _repository.editTag(event.tag);

      add(LoadTags());
    } catch (e) {
      logger(e);

      emit(state.copyWith(loading: false));
    }
  }

  void _deleteTag(
    DeleteTag event,
    Emitter<TagState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      await _repository.deleteTag(event.tag);

      add(LoadTags());
    } catch (e) {
      logger(e);

      emit(state.copyWith(loading: false));
    }
  }

  void _selectTag(
    SelectTag event,
    Emitter<TagState> emit,
  ) async {
    emit(state.copyWith(tag: event.tag));
  }
}
