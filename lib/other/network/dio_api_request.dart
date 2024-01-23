import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioNetwokPage extends StatefulWidget {
  const DioNetwokPage({super.key});

  @override
  State<DioNetwokPage> createState() => _DioNetwokPageState();
}

class _DioNetwokPageState extends State<DioNetwokPage> {
  final dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }


  void getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络请求'),),
      body: Center(
        child: Text('注意观察控制台'),
      ),
    );
  }
}
