import 'dart:convert';

import 'package:c_tracker/cc_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CCList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CCListState();
  }
}

class CCListState extends State<CCList> {
  List<CCData> data = [
    CCData(name: 'Bit', symbol: 'BTC', rank: 1, price: 6000),
    CCData(name: 'Etsss', symbol: 'ETC', rank: 2, price: 200.1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CC Tracker'),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => _loadCC(),
      ),
    );
  }

  List<Widget> _buildList() {
    return data
        .map((CCData f) => ListTile(
              subtitle: Text(f.symbol),
              title: Text(f.name),
              leading: CircleAvatar(child: Text(f.rank.toString())),
              trailing: Text('\$${f.price.toString()}'),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _loadCC();
  }

  _loadCC() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));
    if (response.statusCode == 200) {
      var userData =
          List<Map<String, dynamic>>.from(json.decode(response.body));

      var ccDataList = <CCData>[];

      userData.forEach((element) {
        var record = CCData(name: element['name'], symbol: element['symbol'], rank: element['market_cap_rank'], price: element['current_price']);
        ccDataList.add(record);
      });

      setState(() {
        data = ccDataList;
      });
  }
  }
}
