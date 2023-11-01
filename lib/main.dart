import 'package:flutter/material.dart';
import 'package:helipagos_app/src/model/Coin.dart';
import 'package:helipagos_app/src/screens/coin_detail.dart';
import 'package:helipagos_app/src/screens/coin_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/coins/list',
      routes: <String, WidgetBuilder>{
        CoinList.routeName: (context) => const CoinList(),
        CoinDetail.routeName: (context) {
          final coin = ModalRoute.of(context)!.settings.arguments as Coin;
          return CoinDetail(
            coinId: coin,
          );
        },
      },
    );
  }
}
