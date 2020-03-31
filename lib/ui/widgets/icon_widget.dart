import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String url;
  final double size;
  IconWidget({@required this.url, @required this.size});

  @override
  Widget build(BuildContext context) {
    return (url == null)
        ? Container(height: size, width: size)
        : CachedNetworkImage(
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: url,
      height: size,
      width: size,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}