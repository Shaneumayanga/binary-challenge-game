import 'dart:async';

import 'package:binaryc/pages/select_bits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:binaryc/pages/game_screen.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextStyle introtextstyle = TextStyle(
    color: Colors.red,
    fontSize: 50.0,
    fontFamily: "biotyp",
  );
  Alignment alignment;
  BoxDecoration decoration, challengetext;

  double width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alignment = Alignment.center;
    decoration = BoxDecoration();
    challengetext = BoxDecoration();
    width = 14;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              AnimatedContainer(
                height: double.infinity,
                width: double.infinity,
                curve: Curves.bounceIn,
                decoration: this.decoration,
                duration: Duration(seconds: 1),
              ),
              Container(
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            decoration: this.decoration,
                            curve: Curves.bounceInOut,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Binary",
                                style: introtextstyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                (0.3 / 100),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            decoration: this.challengetext,
                            curve: Curves.bounceInOut,
                            child: Text(
                              "Challenge",
                              style: introtextstyle,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (15 / 100),
                    ),
                    AnimatedContainer(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      height: MediaQuery.of(context).size.height * (10 / 100),
                      width: MediaQuery.of(context).size.height * (width / 100),
                      duration: Duration(seconds: 2),
                      child: FlatButton(
                        color: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            this.alignment = Alignment.centerRight;
                            this.decoration = BoxDecoration(
                                border: Border.all(color: Colors.white));
                            this.challengetext = BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.red)));
                            this.width = 20;
                          });
                          Timer(Duration(seconds: 1), () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SelectBitsPage();
                            }));
                          });
                        },
                        child: AnimatedContainer(
                          alignment: alignment,
                          duration: Duration(seconds: 1),
                          child: Icon(
                            Icons.chevron_right,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
