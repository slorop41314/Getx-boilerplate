class PaginatedResponse<T> {
  int? count;
  String? next;
  String? previous;
  T? results;

  PaginatedResponse({this.count, this.next, this.previous, this.results});

  PaginatedResponse.fromJson(
      Map<String, dynamic> json, Function(dynamic) create) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = create(json['results']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    // if (this.results != null) {
    //   data['results'] = this.results?.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
