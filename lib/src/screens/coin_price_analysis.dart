import 'package:flutter/material.dart';
import 'package:helipagos_app/src/common/httpHandler.dart';
import 'package:helipagos_app/src/model/Market.dart';

class CoinPriceAnalysis extends StatefulWidget {
  static const routeName = '/price_analysis';
  final String coinId;

  const CoinPriceAnalysis({super.key, required this.coinId});

  @override
  _CoinPriceAnalysis createState() => _CoinPriceAnalysis();
}

class _CoinPriceAnalysis extends State<CoinPriceAnalysis> {
  HttpHandler httpHandler = HttpHandler();
  Market? coin;

  @override
  void initState() {
    super.initState();
    String coinId = widget.coinId;
    httpHandler.getMarketAnalysis(coinId).then((result) {
      setState(() {
        coin = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Analysis'),
      ),
    );
  }
}
