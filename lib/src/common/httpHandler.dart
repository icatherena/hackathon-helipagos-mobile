import 'dart:convert';
import 'package:helipagos_app/src/model/Coin.dart';
import 'package:helipagos_app/src/model/CoinId.dart';
import 'package:helipagos_app/src/model/Market.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<Coin>> getListCoins() async {
    final response = await http.get(Uri.parse('$baseUrl/coins/list'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Coin> allCoins = [];
      for (var coin in data) {
        allCoins.add(Coin(
            id: coin['id'] ?? 0, name: coin['name'], symbol: coin['symbol']));
      }
      return allCoins;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<CoinId> getCoin(String coinId) async {
    final response = await http.get(Uri.parse('$baseUrl/coins/$coinId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CoinId.fromJson(data);
    } else {
      throw Exception('Failed to load coin');
    }
  }

  Future<Market> getMarketAnalysis(String coinId) async {
    final response = await http.get(Uri.parse(
        'baseUrl/coins/markets?vs_currency=usd&ids=$coinId&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Market.fromJson(data);
    } else {
      throw Exception('Failed to load market analysis');
    }
  }
}
