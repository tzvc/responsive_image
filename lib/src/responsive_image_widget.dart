import 'package:flutter/widgets.dart';

typedef Widget ResponsiveImageBuilder(BuildContext context, String url);

class ResponsiveImage extends StatelessWidget {
  const ResponsiveImage({Key key, @required this.srcSet, this.builder})
      : assert(srcSet != null),
        super(key: key);

  /// Set of possible source options, each entry containing the
  /// url of the image ressource along with the width in pixel of the targeted image
  final Map<int, String> srcSet;

  /// Optional builder to further customize the display of the image.
  /// If not specified, [Image.network] will be used.
  final ResponsiveImageBuilder builder;

  _selectSrcInSet(double maxWidth) {
    int srcKey = srcSet.keys.reduce((curr, prev) =>
        (curr - maxWidth).abs() < (prev - maxWidth).abs() ? curr : prev);
    return srcSet[srcKey];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      String url = _selectSrcInSet(
          constraints.maxWidth * MediaQuery.of(context).devicePixelRatio);

      return builder != null ? builder(context, url) : Image.network(url);
    });
  }
}
