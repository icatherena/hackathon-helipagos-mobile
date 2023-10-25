class CoinId {
  final String id;
  final String name;
  final String symbol;
  //final String image;

  CoinId({
    required this.id,
    required this.name,
    required this.symbol,
    //required this.image,
  });

  /* factory CoinId.fromJson(Map<String, dynamic> json) {
    return CoinId(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      //image: json['image']
    );
  } */
}
