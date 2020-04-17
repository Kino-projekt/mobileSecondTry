import 'package:flutter/material.dart';

class Price extends StatelessWidget {

  List prices = [
    {
      'name': 'Normalny',
      'price': 20,
    },
    {
      'name': 'Ulgowy',
      'price': 15,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView.builder(
            itemCount: prices.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: ListTile(
                  title: Text(prices[index]['name']),
                  trailing: Text('${prices[index]['price']}zł'),
                ),
              );
            }
          )
        );
  }
}