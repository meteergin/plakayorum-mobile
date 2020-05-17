class Plaka {
  final int id;
  final String no;

  Plaka({this.id, this.no});

  factory Plaka.fromJson(Map<String, dynamic> json) {
    return Plaka(
      id: json['id'] as int,
      no: json['no'] as String,
    );
  }
}
