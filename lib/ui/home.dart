import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrangeAccent,
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Margirita",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Tomato organa onions",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Vegie Delite",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "panner onions caps etc",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                  ],
                ),
                PizzaImageWidget(),
                OrderButton(),
              ],
            )));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaImage = AssetImage('images/pizza.jpg');
    Image image = Image(
      image: pizzaImage,
      width: 300.0,
      height: 300.0,
    );
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = RaisedButton(
      onPressed: () {
        order(context);
      },
      color: Colors.lightGreen,
      child: Text("Order your Pizza!"),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Complete"),
      content: Text("Thanks for your order."),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
