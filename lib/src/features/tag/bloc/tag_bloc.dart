import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/tag_repository.dart';
import '../models/tag.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagRepository _repository;

  TagBloc({required TagRepository repository})
      : _repository = repository,
        super(TagInitial()) {
    on<TagEvent>(
      (event, emit) => switch (event) {
        LoadTags() => throw UnimplementedError(),
        AddTag() => throw UnimplementedError(),
        EditTag() => throw UnimplementedError(),
        DeleteTag() => throw UnimplementedError(),
      },
    );
  }

  // void _loadTags(
  //   LoadTags event, Emitter
  // ) {}
}
