import 'package:flutter/widgets.dart';

class ResponsiveImage extends StatelessWidget {
  final Map<int, String> srcSet;

  const ResponsiveImage({Key key, @required this.srcSet}) : super(key: key);

  _selectSrcInSet(double maxDim) {
    int srcIdx = srcSet.keys.reduce((curr, prev) =>
        (curr - maxDim).abs() < (prev - maxDim).abs() ? curr : prev);
    print("$maxDim ${srcSet[srcIdx]}");
    return srcSet[srcIdx];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Image.network(_selectSrcInSet(
          constraints.maxWidth * MediaQuery.of(context).devicePixelRatio));
    });
  }
}
