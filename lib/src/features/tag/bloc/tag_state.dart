part of 'tag_bloc.dart';

final class TagState {
  TagState({
    this.tags = const [],
    required this.tag,
    this.loading = false,
  });

  final List<Tag> tags;
  final Tag tag;
  final bool loading;

  TagState copyWith({
    List<Tag>? tags,
    Tag? tag,
    bool? loading,
  }) {
    return TagState(
      tags: tags ?? this.tags,
      tag: tag ?? this.tag,
      loading: loading ?? this.loading,
    );
  }
}
