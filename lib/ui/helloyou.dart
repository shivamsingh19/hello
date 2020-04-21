import 'package:flutter/material.dart';

class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = '';
  final _currencies = ['Dollar', 'Rupee', 'Euro'];
  String _currency = 'Dollar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Please input something'),
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _currency,
              onChanged: (String value) {
                _onDropDownChanges(value);
              },
            ),
            Text('Hello ' + name + '!')
          ],
        ),
      ),
    );
  }

  _onDropDownChanges(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
