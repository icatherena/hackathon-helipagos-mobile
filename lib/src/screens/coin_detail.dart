import 'package:flutter/material.dart';
import 'package:helipagos_app/src/common/httpHandler.dart';
import 'package:helipagos_app/src/model/Coin.dart';
import 'package:helipagos_app/src/model/CoinId.dart';
import 'package:url_launcher/url_launcher.dart';

class CoinDetail extends StatefulWidget {
  static const routeName = '/coin_detail';
  final Coin coinId;

  const CoinDetail({super.key, required this.coinId});

  @override
  _CoinDetail createState() => _CoinDetail();
}

class _CoinDetail extends State<CoinDetail> {
  HttpHandler httpHandler = HttpHandler();
  CoinId? coin;

  @override
  void initState() {
    super.initState();
    String coinId = widget.coinId.id;
    httpHandler.getCoin(coinId).then((result) {
      setState(() {
        coin = result;
      });
    });
  }

  _launchURL(String siteUrl) async {
    final Uri url = Uri.parse(siteUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const fallbackImage =
        'https://static-00.iconduck.com/assets.00/generic-cryptocurrency-icon-2048x2048-011eiq5o.png';
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
              coin?.image != null
                  ? Image.network(coin!.image)
                  : Image.network(fallbackImage),
              Card(
                  child: Column(
                children: [
                  Text(coin?.name ?? "Loading..."),
                  Text(coin?.symbol ?? "Loading..."),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(coin!.siteUrl);
                    },
                    child: const Text('Go to its web page'),
                  ),
                ],
              ))
            ]),
      ),
    );
  }
}
