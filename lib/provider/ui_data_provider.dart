import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/provider/provider_view_model.dart';
import 'package:provider/provider.dart';


class UIDataProviderPage extends StatefulWidget {
  const UIDataProviderPage({super.key});

  static Widget provider() {
    return ChangeNotifierProvider(
      builder: (context, child) => UIDataProviderPage(),
      create: (BuildContext context) => UIDataProviderViewModel(),
    );
  }

  @override
  State<UIDataProviderPage> createState() => _UIDataProviderPageState();
}

class _UIDataProviderPageState extends State<UIDataProviderPage> {

  late UIDataProviderViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    viewModel = context.read<UIDataProviderViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据UI绑定'),),
      body: Center(
        child: Container(
          child: Selector<UIDataProviderViewModel, int>(
            selector: (_, model) => model.count,
            builder: (context, count, widget) {
              return Text(
                '${count}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
        viewModel.currentCountAdd();
      }),
    );
  }
}
