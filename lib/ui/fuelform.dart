import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String name = '';
  final _currencies = ['Dollar', 'Rupee', 'Euro'];
  final double _formDistance = 5.0;
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String _currency = "Dollar";
  String result = '';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: distanceController,
                  decoration: InputDecoration(
                      hintText: 'eg 1234',
                      labelStyle: textStyle,
                      labelText: "Distance",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  onChanged: (String string) {
                    setState(() {
                      name = string;
                    });
                  },
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: avgController,
                  decoration: InputDecoration(
                      hintText: 'eg 17',
                      labelStyle: textStyle,
                      labelText: "Distance per unit",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  onChanged: (String string) {
                    setState(() {
                      name = string;
                    });
                  },
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: Row(children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        hintText: 'eg 1.65',
                        labelStyle: textStyle,
                        labelText: "Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                    onChanged: (String string) {
                      setState(() {
                        name = string;
                      });
                    },
                  )),
                  Container(width: _formDistance * 5),
                  Expanded(
                      child: DropdownButton<String>(
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
                  ))
                ])),
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  ),
                )),
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  ),
                )),
              ],
            ),
            Text(result)
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

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}
