# responsive_image

A Flutter library that bring responsive capabilities to images.

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
