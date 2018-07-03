import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new ClipPath(
          child: new Image.network("http://tineye.com/images/widgets/mona.jpg"),
          clipper: new Myclipper(),
        ),
      ),
      )
    );
  }
}

class Myclipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
     var path=new Path();
     path.lineTo(0.0, size.height);

        var firstEndPoint=new Offset(0.0, size.height-15);
        var firstControlPoint=new Offset(20.0, size.height/2+20.0);
        path.quadraticBezierTo(firstEndPoint.dx, firstEndPoint.dy, firstControlPoint.dx
            , firstControlPoint.dy);
     var secondEndPoint=new Offset(size.width-20, size.height/2-10.0);
     var secondControlPoint=new Offset(20.0, size.height-30);
     path.quadraticBezierTo(secondEndPoint.dx, secondEndPoint.dy, secondControlPoint.dx
         , secondControlPoint.dy);
     path.lineTo(size.width, size.height/2);
     path.lineTo(size.width, 0.0);
     path.close();
     return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
