class Market {
  final String id;
  final String name;
  final String symbol;
  final double currentPriceUsd;
  final double priceChangePercentage;
  final int marketCap;
  final int marketCapRank;
  final String totalVolume;

  Market({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPriceUsd,
    required this.priceChangePercentage,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
  });

  factory Market.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String name = json['name'];
    final String symbol = json['symbol'];
    final double currentPriceUsd = json['current_price'];
    final double priceChangePercentage = json['price_change_percentage_24h'];
    final int marketCap = json['market_cap'];
    final int marketCapRank = json['market_cap_rank'];
    final String totalVolume = json['total_volume'];
    return Market(
      id: id,
      name: name,
      symbol: symbol,
      currentPriceUsd: currentPriceUsd,
      priceChangePercentage: priceChangePercentage,
      marketCap: marketCap,
      marketCapRank: marketCapRank,
      totalVolume: totalVolume,
    );
  }
}
