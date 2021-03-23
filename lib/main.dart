import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relative Scale demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: RelativeBuilder(
          builder: (context, height, width, sy, sx) {
            print("$width $height ${sy(1)} ${sx(1)}");
            return SingleChildScrollView(
              clipBehavior: Clip.none,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Image(
                    height: height,
                    image: const AssetImage("assets/map.jpg"),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: sy(190),
                    left: sy(190),
                    child: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.accessibility_new,
                        size: sy(22.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: sy(155),
                    left: sy(87),
                    child: Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.accessibility_new,
                        size: sy(22.0),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
