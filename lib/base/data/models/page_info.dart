
import 'package:freezed_annotation/freezed_annotation.dart';


part 'page_info.g.dart';

@JsonSerializable()
class PageInfo {
  final bool hasNextPage;
  final String? cursor;
  final int lastTake;
  final int totalAmount;

  PageInfo({required this.hasNextPage, this.cursor, required this.lastTake, required this.totalAmount});

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}