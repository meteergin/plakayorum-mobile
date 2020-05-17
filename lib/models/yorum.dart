class Yorum {
  final int id;
  final int plakaId;
  final int durum;
  final String icerik;

  Yorum({this.id, this.plakaId, this.durum, this.icerik});

  factory Yorum.fromJson(Map<String, dynamic> json) {
    return Yorum(
      plakaId: json['plakaId'] as int,
      id: json['id'] as int,
      durum: json['durum'] as int,
      icerik: json['icerik'] as String,
    );
  }
}
