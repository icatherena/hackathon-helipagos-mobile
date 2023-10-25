import 'package:flutter/material.dart';
import 'package:helipagos_app/src/common/httpHandler.dart';
import 'package:helipagos_app/src/model/Coin.dart';
import 'package:helipagos_app/src/screens/coin_detail.dart';

class CoinList extends StatefulWidget {
  const CoinList({super.key});
  static const routeName = '/coins/list';
  @override
  _CoinList createState() => _CoinList();
}

class _CoinList extends State<CoinList> {
  HttpHandler httpHandler = HttpHandler();
  List<Coin> allCoins = [];
  List<Coin> filteredCoins = [];

  TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    httpHandler.getListCoins().then((result) {
      setState(() {
        allCoins = result;
        filteredCoins = List.from(allCoins);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView.builder(
          itemCount: allCoins.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CoinDetail(coinId: allCoins[index].id)),
                    );
                    /* Navigator.pushNamed(
                      context,
                      '/coin_detail',
                      arguments: {allCoins[index].id},
                    ); */
                  },
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Coin symbol:',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        allCoins[index].symbol,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Coin name:',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(allCoins[index].name),
                      ]),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Filter Coins'),
                content: TextField(
                  controller: filterController,
                  onChanged: (text) {
                    filterCoins(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter a text to filter',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        //allCoins.remove(!allCoins.contains(filteredCoins));
                        allCoins.retainWhere(
                            (coin) => filteredCoins.contains(coin));
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Search'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }

  void filterCoins(String text) {
    setState(() {
      filteredCoins = allCoins
          .where((coin) =>
              coin.name.toLowerCase().contains(text.toLowerCase()) ||
              coin.symbol.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }
}

/* class FilteredCoins extends StatelessWidget {
  const FilteredCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Coins'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView.builder(
          itemCount: filteredCoins.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CoinDetail(coinId: filteredCoins[index].id)),
                    );
                    /* Navigator.pushNamed(
                      context,
                      '/coin_detail',
                      arguments: {allCoins[index].id},
                    ); */
                  },
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Coin symbol:',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        filteredCoins[index].symbol,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Coin name:',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(filteredCoins[index].name),
                      ]),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
 */