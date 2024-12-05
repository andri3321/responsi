class Amiibo {
  final String image;
  final String name;
  final String gameSeries;

  Amiibo({
    required this.image,
    required this.name,
    required this.gameSeries,
  });

  factory Amiibo.fromJson(Map<String, dynamic> json) {
    return Amiibo(
      image: json['image'],
      name: json['name'],
      gameSeries: json['gameSeries'],
    );
  }
}
