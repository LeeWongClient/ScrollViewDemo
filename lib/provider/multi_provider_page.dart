import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/provider/provider_view_model.dart';
import 'package:flutter_ui_demo/provider/ui_data_provider2.dart';
import 'package:provider/provider.dart';

class MultiProviderPage extends StatefulWidget {
  const MultiProviderPage({super.key});

  static Widget provider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UIDataProviderViewModel()),
        ChangeNotifierProvider(create: (context) => UIDataProvider2ViewModel()),
      ],
      child: MultiProviderPage(),
    );
  }

  @override
  State<MultiProviderPage> createState() => _MultiProviderPageState();
}

class _MultiProviderPageState extends State<MultiProviderPage> {
  late UIDataProviderViewModel viewModel;
  late UIDataProvider2ViewModel viewModel2;

  @override
  void initState() {
    // TODO: implement initState
    viewModel = context.read<UIDataProviderViewModel>();
    viewModel2 = context.read<UIDataProvider2ViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据UI绑定'),),
      body: Center(
        child: Container(
          child: Selector2<UIDataProviderViewModel, UIDataProvider2ViewModel, int>(
            selector: (_, model, model2) => model.count + model2.count,
            builder: (context, count, widget) {
              return Text(
                '${count}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),);
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(heroTag: 1, child: Icon(Icons.add), onPressed: (){
            viewModel.currentCountAdd();
          }),
          FloatingActionButton(heroTag: 2, child: Icon(Icons.exposure_minus_1), onPressed: (){
            viewModel2.currentCountMinus();
          }),
        ],
      )


    );
  }
}
