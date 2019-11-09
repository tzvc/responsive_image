import 'package:flutter/material.dart';
import 'package:responsive_image/responsive_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  final List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 4),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
  ];

  final Map<int, String> srcSet = {
    64: "https://via.placeholder.com/64",
    128: "https://via.placeholder.com/128",
    256: "https://via.placeholder.com/256",
    512: "https://via.placeholder.com/512",
    1024: "https://via.placeholder.com/1024",
  };

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _staggeredTiles,
          children: List<Widget>.generate(
              _staggeredTiles.length,
              (int index) => ResponsiveImage(
                    srcSet: srcSet,
                  )),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ));
  }
}
