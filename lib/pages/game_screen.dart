import 'dart:async';
import 'dart:ui';

import 'package:binaryc/utils/converter.dart';
import 'package:binaryc/utils/faker.dart';
import 'package:binaryc/utils/randomBinmaker.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GameScreen extends StatefulWidget {
  final bits;
  final type;
  GameScreen({this.bits, this.type});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextStyle textStyle;

  String binary;
  var answer;
  List<Widget> buttons = [];
  int lives;
  int seconds;

  //not used:
  bool isanswerselected = false;
  bool isgamefinised = false;
  var selectedanswer;
  var selectedanswertext = ".";
  String result = "";
  Color resultcolor = Colors.green;
  int widthofLine;

  List<String> correctanswers = [];
  List<String> wronganswers = [];
  bool isapptesting = false;

  @override
  initState() {
    super.initState();
    FacebookAudienceNetwork.init();
    //print("bits");
    //print(widget.bits);
    // print(widget.type);

    widthofLine = 70;
    if (widget.bits > 4) {
      lives = 16;
      seconds = 5;
    } else {
      lives = 8;
      seconds = 3;
    }
    start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  

  }

  


  void start() {
    if (this.lives == 0) {
      setState(() {
        binary = "Game Finished";
        buttons = [];
        isgamefinised = true;
        widthofLine = 20;
      });
      print("Wrong answers....");
      print(this.wronganswers);
      print("Correct answers...");
      print(this.correctanswers);
      return;
    }
    setState(() {
      //resetting
      widthofLine = 70;
      isanswerselected = false;
      this.selectedanswertext = ".";
      this.result = "";
      this.buttons = [];
      binary = BinService(length: widget.bits).makeBinString();
    });
    genanswers();
    fake();
    shuffleButtons();
    Timer(Duration(seconds: this.seconds), start);
   
  }

  Widget makeAnswerButton(answer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, style: BorderStyle.solid)),
        child: FlatButton(
          color: Colors.black,
          hoverColor: Colors.white,
          onPressed: () {
            if (answer == this.answer) {
              setState(() {
                this.result = "Correct!";
                this.resultcolor = Colors.green;
                this.correctanswers.add(binary);
              });
            } else {
              setState(() {
                this.result = "Wrong!";
                this.resultcolor = Colors.red;
                this.wronganswers.add(binary);
              });
              setState(() {
                lives--;
              });
            }
            setState(() {
              this.buttons = [];
              widthofLine = 20;
              this.selectedanswertext = answer.toString();
            });
          },
          child: Text(
            "$answer",
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  void genanswers() {
    switch (widget.type) {
      case "Decimal":
        setState(() {
          answer = BinConverter(bin: this.binary).converterTodecimal();
          print("Answer : $answer");
          buttons.add(makeAnswerButton(answer));
        });
        break;
      case "Hex":
        setState(() {
          answer = BinConverter(bin: this.binary).convertTohex();
          print("Answer : $answer");
          buttons.add(makeAnswerButton(answer));
        });
        break;
      case "Octal":
        setState(() {
          answer = BinConverter(bin: this.binary).convertToOct();
          print("Answer : $answer");
          buttons.add(makeAnswerButton(answer));
        });
        break;
    }
  }

  void fake() {
    switch (widget.type) {
      case "Decimal":
        for (var i = 0; i < 3; i++) {
          var fakeval = Faker(type: "Decimal", binary: this.binary).genfake();
          buttons.add(makeAnswerButton(fakeval));
        }
        break;
      case "Hex":
        for (var i = 0; i < 3; i++) {
          var fakeval = Faker(type: "Hex", binary: this.binary).genfake();
          buttons.add(makeAnswerButton(fakeval));
        }
        break;
      case "Octal":
        for (var i = 0; i < 3; i++) {
          var fakeval = Faker(type: "Oct", binary: this.binary).genfake();
          buttons.add(makeAnswerButton(fakeval));
        }

        break;
    }
  }

  void shuffleButtons() {
    setState(() {
      buttons.shuffle();
    });
  }

  Widget showScores() {
    return Column(
      children: [
        Text(
          "Correct Responses : ${this.correctanswers.length}",
          style: TextStyle(color: Colors.green, fontFamily: "biotyp"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Wrong Responses : ${this.wronganswers.length}",
          style: TextStyle(color: Colors.red, fontFamily: "biotyp"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isgamefinised
              ? Container()
              : Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lives : ",
                        style:
                            TextStyle(color: Colors.red, fontFamily: "biotyp"),
                      ),
                      Text("${this.lives}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this.binary == null
                    ? Text(
                        "Loading...",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontFamily: "biotyp"),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${this.binary.toString()}",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: "biotyp",
                                fontWeight: FontWeight.w700,
                                fontSize: 35.0,
                                letterSpacing: 10),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                isgamefinised
                    ? Container(child: showScores())
                    : Text(
                        "${this.selectedanswertext}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700),
                      ),
                isgamefinised
                    ? Container()
                    : Text(
                        "$result",
                        style: TextStyle(
                            color: this.resultcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      ),
                AnimatedContainer(
                  duration: Duration(seconds: this.seconds),
                  width:
                      MediaQuery.of(context).size.width * (widthofLine / 100),
                  child: Divider(color: Colors.red),
                ),
                GridView.count(
                  childAspectRatio: (3),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  crossAxisSpacing: 8,
                  children: List.generate(this.buttons.length, (index) {
                    return buttons[index];
                  }),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
