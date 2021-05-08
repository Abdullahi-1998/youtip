import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Youtip());
}

class Youtip extends StatefulWidget {
  Youtip({Key key}) : super(key: key);

  @override
  _YoutipState createState() => _YoutipState();
}

class _YoutipState extends State<Youtip> {
  final controller = TextEditingController();
  final splitcontroller = TextEditingController();
  List<bool> isSelected = [true, false, false, false, false];

  String tip;

  String splitTip;

  String totalBill;

  String percentageTip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
      ),
      home: Scaffold(
        backgroundColor: Color(0xff81b29a),
        appBar: AppBar(
          title: Text('YouTib'),
          backgroundColor: Color(0xff81b29a),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (tip == null)
                Container(
                  width: double.maxFinite,
                  height: 250,
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              if (tip != null)
                Container(
                  width: double.maxFinite,
                  height: 230.0,
                  margin: EdgeInsets.all(16.0),
                  child: Card(
                    color: Color(0xffe07a5f),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          totalBill,
                          style: TextStyle(
                            fontSize: 45.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Tip amount',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Split amount',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'percentage',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              tip,
                              style: TextStyle(
                                fontSize: 27.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              splitTip,
                              style: TextStyle(
                                fontSize: 27.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              percentageTip,
                              style: TextStyle(
                                fontSize: 27.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customRow(Icons.attach_money, "Bill"),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '\$100.00',
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customRow(Icons.edit, "Tip"),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      child: ToggleButtons(
                        children: [
                          Text(
                            '5%',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10%',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '15%',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '20%',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '25%',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        isSelected: isSelected,
                        onPressed: updateSelection,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customRow(Icons.people, "Split"),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      child: TextField(
                        controller: splitcontroller,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'No.of People to Split with',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 240.0,
                padding: EdgeInsets.only(
                  left: 30.0,
                ),
                margin: EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffe07a5f),
                  ),
                  child: Text(
                    'Calculate Your Tip',
                    style: TextStyle(color: Colors.white, fontSize: 19.0),
                  ),
                  onPressed: () {
                    calculateTip();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row customRow(IconData iconData, String label) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.all(3.0),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final splitAmount = double.parse(splitcontroller.text);
    final selectedIndex = isSelected.indexWhere((element) => element);
    final tipPercentage = [0.05, 0.1, 0.15, 0.2, 0.25][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    double finalTipTotal = double.parse(tipTotal);

    final tipSplitamount = (finalTipTotal / splitAmount).toStringAsFixed(2);

    final percentagetip = tipPercentage * 100;

    setState(() {
      tip = '$tipTotal';
      splitTip = '\$$tipSplitamount';
      totalBill = '\$$totalAmount';
      percentageTip = '$percentagetip%';
    });
  }
}
