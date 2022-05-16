class Pages {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPage;
  final dynamic users;

  const Pages(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPage,
      required this.users});

  factory Pages.fromJson(Map<String, dynamic> json) {
    return Pages(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPage: json['total_pages'],
      users: List<Data>.from(
        json['data'].map((data) => Data.fromJson(data)),
      ),
    );
  }
}

class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  const Data(
      {required this.id,
      required this.name,
      required this.year,
      required this.color,
      required this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        name: json['name'],
        year: json['year'],
        color: json['color'],
        pantoneValue: json['pantone_value']);
  }
}
