import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class NetworkImagePreview extends StatefulWidget {
  const NetworkImagePreview({super.key});

  @override
  State<NetworkImagePreview> createState() => _NetworkImagePreviewState();
}

class _NetworkImagePreviewState extends State<NetworkImagePreview> {
  List<String> pics = ['https://pic.616pic.com/bg_w1180/00/14/86/YCnYPJmxlf.jpg', 'https://i.pinimg.com/736x/1e/55/84/1e55849e16abf03168b4f6c36cc513b5.jpg', 'https://img.ipzzzz.com/up/allimg/4k/s/02/210924225G3E34-0-lp.jpg'];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络图片预览'),),
      body: ExtendedImageGesturePageView.builder(
        itemBuilder: (BuildContext context, int index) {
          var item = pics[index];
          Widget image = ExtendedImage.network(
            item,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
          );
          image = Container(
            child: image,
            padding: EdgeInsets.all(5.0),
          );
          if (index == currentIndex) {
            return Hero(
              tag: item + index.toString(),
              child: image,
            );
          } else {
            return image;
          }
        },
        itemCount: pics.length,
        onPageChanged: (int index) {
          currentIndex = index;
          print('current index is $currentIndex');
        },
        controller: ExtendedPageController(
          initialPage: currentIndex,
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
