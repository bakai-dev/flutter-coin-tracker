import 'package:c_tracker/cc_data.dart';
import 'package:flutter/material.dart';

class CCList extends StatelessWidget {

  List<CCData> data = [
    CCData(name: 'Bit', symbol: 'BTC', rank: 1, price: 6000),
    CCData(name: 'Et', symbol: 'ETC', rank: 2, price: 200.1)
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
    );
  }

  List<Widget> _buildList() {
    return data.map((CCData f) => ListTile(
      subtitle: Text(f.symbol),
      title: Text(f.name),
      leading: CircleAvatar(child: Text(f.rank.toString())),
      trailing: Text('\$${f.price.toString()}'),
    )).toList();
  }
}