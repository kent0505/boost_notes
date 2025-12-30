part of 'tag_bloc.dart';

@immutable
sealed class TagEvent {}

final class LoadTags extends TagEvent {}

final class AddTag extends TagEvent {
  AddTag({required this.tag});

  final Tag tag;
}

final class EditTag extends TagEvent {
  EditTag({required this.tag});

  final Tag tag;
}

final class DeleteTag extends TagEvent {
  DeleteTag({required this.tag});

  final Tag tag;
}

final class SelectTag extends TagEvent {
  SelectTag({required this.tag});

  final Tag tag;
}
