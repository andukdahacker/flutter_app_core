import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_job_input.g.dart';

@JsonSerializable()
class SearchJobInput {
  SearchJobInput({
    required this.take,
    required this.searchString,
    this.stringCursor,
    this.fee,
    this.jobType,
    this.jobMethod,
    this.sortBy,
  });

  int take;
  String? stringCursor;
  String searchString;

  num? fee;
  String? jobType;
  String? jobMethod;
  String? sortBy;

  Map<String, dynamic> toJson() => _$SearchJobInputToJson(this);
}
