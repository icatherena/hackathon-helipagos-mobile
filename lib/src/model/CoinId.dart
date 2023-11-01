class CoinId {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final String siteUrl;

  CoinId(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.image,
      required this.siteUrl});

  factory CoinId.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String name = json['name'];
    final String symbol = json['symbol'];
    final String image = json['image']['large'];
    final String siteUrl = json['links']['homepage'][0];
    return CoinId(
      id: id,
      name: name,
      symbol: symbol,
      image: image,
      siteUrl: siteUrl,
    );
  }
}
