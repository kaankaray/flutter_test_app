import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'A great application indeed!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _customColor = Colors.deepPurple;

  /// Generates and returns a random color with alpha - 255
  Color getRandomColor() {
    var rng = new Random();
    return Color.fromARGB(
        255, // I was told as generated color count should be (256 ** 3)
        rng.nextInt(256),
        rng.nextInt(256),
        rng.nextInt(256));
  }

  /// Returns inverted color of the inputted color.
  Color invertedColor(Color input){
    return Color.fromARGB(
        255,
        255 - input.red,
        255 - input.green,
        255 - input.blue);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // We can have an custom AppBar to have onTap listener. But do we really need an AppBar?
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),

      /// Detecting any taps on screen.
      body: GestureDetector(
        /// .translucent targets both receive events within their bounds and
        /// permit targets visually behind them to also receive events.
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            _customColor = getRandomColor();
          });
        },

        child: Container(
          height : MediaQuery.of(context).size.height,
          width : MediaQuery.of(context).size.width,
          color: _customColor,

          child: Column(
          // For some reason, column keeps on falling short.
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height : MediaQuery.of(context).size.height - 24,
                child: Text(
                  'Hey there!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: invertedColor(_customColor)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                    'Kaan Karay\nkaankaray99@gmail.com',
                    style: TextStyle(
                        fontSize: 10,
                        color: invertedColor(_customColor)
                    ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
