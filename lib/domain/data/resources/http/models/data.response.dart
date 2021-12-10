import 'package:dart_json_mapper/dart_json_mapper.dart';

/// Class representing a response
@jsonSerializable
class DataResponse {
  /// data
  @JsonProperty(name: 'data')
  final dynamic body;

  /// pagination
  final Meta? meta;

  /// constructor
  DataResponse(this.body, this.meta);

  /// Get data
  @JsonProperty(ignore: true)
  T? data<T>() {
    return JsonMapper.deserialize<T>(body);
  }
}

///
/// [Pagination]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class Pagination {
  ///
  /// Total of items
  ///
  final int total;

  ///
  /// Number of items in the response
  ///
  final int count;

  ///
  /// Number of items per page/request
  ///
  final int perPage;

  ///
  /// Current page
  ///
  final int currentPage;

  ///
  /// Number of pages
  ///
  final int totalPages;

  ///
  /// Link to the next page/request uri
  ///
  final String? nextLink;

  ///
  /// Constructor
  ///
  const Pagination(
      {required this.total,
      required this.count,
      required this.currentPage,
      required this.perPage,
      required this.totalPages,
      this.nextLink});

  ///
  /// Check if there's a next page
  ///
  bool get hasNext => currentPage < totalPages;

  ///
  ///  next page
  ///
  int? get nextPage => hasNext ? currentPage + 1 : null;
}

///
/// [Meta]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class Meta {
  ///
  /// Total of items
  ///
  final Pagination pagination;

  ///
  /// Constructor
  ///
  const Meta({required this.pagination});
}
