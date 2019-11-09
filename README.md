# responsive_image

A Flutter library that bring responsive capabilities to images.

Given a set of source URLs, the widget select the approriate source depending on the rendering size of the child widget, the pixel density of the device and a user defined scaling preference.

![example staggered tiles](https://user-images.githubusercontent.com/14275989/68531453-7f676a80-0312-11ea-96d1-55c28bdbc4a6.png)


## Features

- Automatic image source selection based on size and device pixel density
- Adjustable scaling preference
- Extendability and customization with builder

## Example

Basic usage:

```dart
ResponsiveImage(
  srcSet: {
    64: "https://via.placeholder.com/64",
    128: "https://via.placeholder.com/128",
    256: "https://via.placeholder.com/256",
    512: "https://via.placeholder.com/512",
  },
  scalePreference: ScalePreference.Upper,
);
```

Usage with builder for further customization of the displayed image:

```dart
ResponsiveImage(
  srcSet: {
    256: "https://via.placeholder.com/256",
    512: "https://via.placeholder.com/512",
    1024: "https://via.placeholder.com/1024",
  },
  builder: (BuildContext context, String url) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  },
);
```
