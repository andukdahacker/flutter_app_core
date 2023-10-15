import 'package:freezed_annotation/freezed_annotation.dart';

import 'page_info.dart';

class Paginated<T> {
  final List<T> nodes;
  final PageInfo pageInfo;

  Paginated({required this.nodes, required this.pageInfo});

  factory Paginated.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic>) fromJsonT) =>
      Paginated(
        nodes: (json['nodes'] as List)
            .map((e) => fromJsonT(e))
            .toList(),
        pageInfo: PageInfo.fromJson(json['pageInfo']),
      );

  Map<String, dynamic> toJson(Paginated<T> instance,
          Map<String, dynamic>? Function(T value) toJsonT) =>
      {
        'nodes': instance.nodes.map((e) => toJsonT(e)).toList(),
        'pageInfo': instance.pageInfo.toJson(),
      };
}
