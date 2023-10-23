import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_subject_input.g.dart';

@JsonSerializable()
class SearchSubjectInput {
  final String searchString;
  final String? stringCursor;
  final int take;

  SearchSubjectInput({required this.searchString, required this.take, this.stringCursor});

  Map<String, dynamic> toJson() => _$SearchSubjectInputToJson(this);
}
