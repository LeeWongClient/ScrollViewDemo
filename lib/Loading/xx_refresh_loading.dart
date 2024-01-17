
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

///默认的加载动画
class XXLoadingIndicator extends StatelessWidget {
  const XXLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   alignment: Alignment.center,
    //   child: CircularProgressIndicator(color: AppTheme.greenPrimary, strokeWidth: 3),
    // );
    return Container(alignment: Alignment.center, child: const SampleProgressHud());
  }
}

class SampleProgressHud extends StatefulWidget {
  const SampleProgressHud({super.key});

  @override
  State<SampleProgressHud> createState() => _SampleProgressHudState();
}

class _SampleProgressHudState extends State<SampleProgressHud> with SingleTickerProviderStateMixin {
  // late GifController _gifController;
  late AnimationController lottieAnimController;

  @override
  void initState() {
    // _gifController = GifController(vsync: this);
    // _gifController.value = 0;
    // _gifController.repeat(min: 0, max: 116, period: Duration(milliseconds: 2000));
    lottieAnimController = AnimationController(vsync: this);
    lottieAnimController.repeat(period: const Duration(milliseconds: 2000));

    super.initState();
  }

  @override
  void dispose() {
    // _gifController.dispose();
    lottieAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loading.json', width: 28, controller: lottieAnimController);
  }
}