import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      primaryColor: Colors.blueAccent,
      backgroundColor: Colors.lightBlue,
      appBarTheme:
      AppBarTheme(centerTitle: true, brightness: Brightness.light)),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int firstnum;
  int secondnum;
  String operation;
  String res;
  String display = '';

  void function(String btny) {
    try {
      if (btny == 'C') {
        display = '';
        res = '';
        firstnum = 0;
        secondnum = 0;
      } else if (btny == '/' || btny == 'X' || btny == '-' || btny == '+') {
        firstnum = int.parse(display);
        res = '';
        operation = btny;
      } else if (btny == '=') {
        secondnum = int.parse(display);
        if (operation == "+") {
          res = (firstnum + secondnum).toString();
        }
        if (operation == "-") {
          res = (firstnum - secondnum).toString();
        }
        if (operation == "X") {
          res = (firstnum * secondnum).toString();
        }
        if (operation == "/") {
          res = (firstnum ~/ secondnum).toString();
        }
      } else {
        res = (btny + display).toString();
      }

      setState(() {
        display = res;
      });
    } catch (e) {
      display = 'null';
      setState(() {
        display = res;
      });
    }
  }

  Widget button(var buttondval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30.0),
        onPressed: () => function(buttondval),
        child: Text(
          buttondval,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculater'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$display',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Row(
              children: [button('7'), button('8'), button('9'), button('/')],
            ),
            Row(
              children: [button('4'), button('5'), button('6'), button('X')],
            ),
            Row(
              children: [button('1'), button('2'), button('3'), button('-')],
            ),
            Row(
              children: [button('0'), button('C'), button('='), button('+')],
            ),
          ],
        ));
  }
}
