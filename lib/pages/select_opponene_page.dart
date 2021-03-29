//SelectOpponentPage
import 'package:binaryc/pages/game_screen.dart';
import 'package:flutter/material.dart';

class SelectOpponentType extends StatefulWidget {
  final bits;
  SelectOpponentType({this.bits});
  @override
  _SelectOpponentTypeState createState() => _SelectOpponentTypeState();
}

class _SelectOpponentTypeState extends State<SelectOpponentType> {
  TextStyle titletextstyle =
      TextStyle(color: Colors.red, fontFamily: "biotyp", fontSize: 24.0);
  TextStyle listchecktitletextstyle =
      TextStyle(color: Colors.red, fontFamily: "biotyp", fontSize: 24.0);
  int bits;
  List<String> titles = ["Decimal", "Hex", "Octal"];
  List<Widget> selectors = [];

  @override
  initState() {
    super.initState();
    bits = widget.bits;
  }

  Widget buildSeletor() {
    return Container(
      child: Column(children: [
        ListTile(
          title: Text(
            "${titles[0]}",
            style: this.titletextstyle,
          ),
          trailing: Icon(
            Icons.chevron_right_sharp,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(
                bits: widget.bits,
                type: titles[0],
              );
            }));
          },
        ),
        ListTile(
            title: Text(
              "${titles[1]}",
              style: this.titletextstyle,
            ),
            trailing: Icon(
              Icons.chevron_right_sharp,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameScreen(
                  bits: widget.bits,
                  type: titles[1],
                );
              }));
            }),
        ListTile(
          title: Text(
            "${titles[2]}",
            style: this.titletextstyle,
          ),
          trailing: Icon(
            Icons.chevron_right_sharp,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(
                bits: widget.bits,
                type: titles[2],
              );
            }));
          },
        ),
      ]),
    );
  }

  lauchOpponentScreen(type) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GameScreen(bits: this.bits, type: type);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose your Opponent",
            style: this.titletextstyle,
          ),
          Container(
            width: MediaQuery.of(context).size.width * (70 / 100),
            child: Divider(
              color: Colors.red,
            ),
          ),
          buildSeletor(),
          Container(
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
