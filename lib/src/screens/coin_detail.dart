import 'package:flutter/material.dart';
import 'package:helipagos_app/src/common/httpHandler.dart';
import 'package:helipagos_app/src/model/CoinId.dart';

class CoinDetail extends StatefulWidget {
  static const routeName = '/coin_detail';
  final String coinId;

  const CoinDetail({Key? key, required this.coinId}) : super(key: key);

  @override
  _CoinDetail createState() => _CoinDetail(coinId);
}

class _CoinDetail extends State<CoinDetail> {
  HttpHandler httpHandler = HttpHandler();
  CoinId? coin;

  _CoinDetail(String coinId);

  @override
  void initState() {
    super.initState();
    httpHandler.getCoin(widget.coinId).then((result) {
      setState(() {
        coin = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Details'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  child: Column(
                children: [
                  Text(coin?.name ?? "Loading..."),
                  Text(coin?.symbol ?? "Loading...")
                ],
              ))
            ]),
      ),
    );
  }
}
