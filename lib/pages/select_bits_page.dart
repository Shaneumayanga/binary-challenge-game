import 'package:binaryc/pages/select_opponene_page.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class SelectBitsPage extends StatefulWidget {
  @override
  _SelectBitsPageState createState() => _SelectBitsPageState();
}

class _SelectBitsPageState extends State<SelectBitsPage> {
  TextStyle titletextstyle =
      TextStyle(color: Colors.red, fontFamily: "biotyp", fontSize: 24.0);
  TextStyle listchecktitletextstyle =
      TextStyle(color: Colors.red, fontFamily: "biotyp", fontSize: 24.0);

  List<String> titles = ["4-bit Binary", "8-bit Binary", "16-bit Binary"];
  List<int> values = [4, 8, 16];
  List<Widget> selectors = [];
  bool isapptesting = false;

  @override
  initState() {
        FacebookAudienceNetwork.init();

    super.initState();
   // showad();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }





  

  Widget buildSeletor() {
    return Container(
      child: Column(
        children: [
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
                return SelectOpponentType(
                  bits: 4,
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
                  return SelectOpponentType(
                    bits: 8,
                  );
                }));
              }),
        ],
      ),
    );
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
            "Choose wisely",
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
