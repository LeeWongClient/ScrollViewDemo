import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class NetworkImageEditPage extends StatefulWidget {
  const NetworkImageEditPage({super.key});

  @override
  State<NetworkImageEditPage> createState() => _NetworkImageEditPageState();
}

class _NetworkImageEditPageState extends State<NetworkImageEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片编辑'),),
      body: ExtendedImage.network(
        'https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_639c3c682573ede2ef7e67c9_Best_Flutter_app_development_tools_and_app_builders_OG_image_ac87c76436.jpg',
        fit: BoxFit.contain,
        mode: ExtendedImageMode.editor,
        initEditorConfigHandler: (state) {
          return EditorConfig(
              maxScale: 8.0,
              cropRectPadding: EdgeInsets.all(20.0),
              hitTestSize: 20.0,
              );
        },
      ),
    );
  }
}
