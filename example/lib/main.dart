import 'package:flutter/material.dart';
import 'package:responsive_image/responsive_image.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Image Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Responsive Image Demo'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  _buildSizedContainer(double height, double width, double pixelRatio) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
            "h:$height w:$width (h:${height * pixelRatio}px w:${width * pixelRatio}px)"),
        SizedBox(
            height: height,
            width: width,
            child: ResponsiveImage(srcSet: {
              128: "https://via.placeholder.com/128",
              256: "https://via.placeholder.com/256",
              512: "https://via.placeholder.com/512",
              1024: "https://via.placeholder.com/1024"
            })),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSizedContainer(128, 128, pixelRatio),
              _buildSizedContainer(256, 256, pixelRatio),
              _buildSizedContainer(512, 512, pixelRatio),
              _buildSizedContainer(1024, 1024, pixelRatio)
            ],
          ),
        ));
  }
}
