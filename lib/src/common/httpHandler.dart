import 'dart:convert';
import 'package:helipagos_app/src/model/Coin.dart';
import 'package:helipagos_app/src/model/CoinId.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<Coin>> getListCoins() async {
    final response = await http.get(Uri.parse('$baseUrl/coins/list'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<Coin> allCoins = [];
      for (var coin in data) {
        allCoins.add(
            Coin(id: coin['id'], name: coin['name'], symbol: coin['symbol']));
      }
      return allCoins;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<CoinId> getCoin(String coinId) async {
    final response = await http.get(Uri.parse('$baseUrl/coins/$coinId'));
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      CoinId coin = data;
      return coin;
    } else {
      throw Exception('Failed to load coin');
    }
  }
}
