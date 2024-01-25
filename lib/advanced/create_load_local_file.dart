import 'dart:convert';
import 'dart:io';
import 'package:flutternative/src/flutter_native_communication.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LoadAndCreateLocalFilePage extends StatefulWidget {
  const LoadAndCreateLocalFilePage({super.key});

  @override
  State<LoadAndCreateLocalFilePage> createState() => _LoadAndCreateLocalFilePageState();
}

class _LoadAndCreateLocalFilePageState extends State<LoadAndCreateLocalFilePage> {

  late String localFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter生成-->native加载'),),
      body: Column(
        children: [
          SizedBox(height: 100,),
          TextButton(onPressed: _onCreateFile, child: Text('点击生成文件')),
          SizedBox(height: 50,),
          TextButton(onPressed: _onTapReadFile, child: Text('Native加载本地文件'))
        ],
      ),
    );
  }

  _onCreateFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/flutterfile.json';
    localFilePath = filePath;
    final File file = File(filePath);
    String str = 'Hello, World!';
    List<int> bytes = utf8.encode(str);
    await file.writeAsBytes(bytes);
    print("文件写入成功");
  }


  _onTapReadFile() {
    FlutterNativePlugin.getFileAtPath (localFilePath);
  }


}
