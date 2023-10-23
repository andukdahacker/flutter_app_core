import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_tutor_input.g.dart';

@JsonSerializable()
class SearchTutorInput {
  SearchTutorInput({required this.searchString, required this.take, this.stringCursor});

  final String searchString;

  final String? stringCursor;

  final int take;

  Map<String, dynamic> toJson() => _$SearchTutorInputToJson(this);
}