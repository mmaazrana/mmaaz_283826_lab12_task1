import 'dart:async';

import 'package:flutter/material.dart';

import '../streams/color_stream.dart';

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({Key? key}) : super(key: key);

  @override
  StreamHomePageState createState() => StreamHomePageState();
}

class StreamHomePageState extends State<StreamHomePage> {
  // Making initializations for the home screen
  late Color bgColor = Colors.amber;
  late ColorStream colorStream;
  late StreamSubscription stream;

  @override
  void initState() {
    colorStream = ColorStream();
    // Starting to listen to the color-stream
    changeColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Container(
        color: bgColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Stop listening to the stream
                stream.cancel();
              },
              child: const Text('Stop'),
            )
          ],
        ),
      ),
    );
  }

  // Method to keep listening to the stream and updating the UI
  changeColor() async {
    stream = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
}
