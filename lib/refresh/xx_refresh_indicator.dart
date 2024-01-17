import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:lottie/lottie.dart';
class XXRefreshIndicator extends StatefulWidget {
  const XXRefreshIndicator(this.info, {super.key});
  final PullToRefreshScrollNotificationInfo? info;

  @override
  State<XXRefreshIndicator> createState() => _XXRefreshIndicatorState();
}

class _XXRefreshIndicatorState extends State<XXRefreshIndicator> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.info == null) {
      return Container();
    }
    final PullToRefreshScrollNotificationInfo info = widget.info!;

    switch (info.mode) {
      case PullToRefreshIndicatorMode.refresh:
      case PullToRefreshIndicatorMode.snap:
        controller.forward();
      case PullToRefreshIndicatorMode.done:
      case PullToRefreshIndicatorMode.canceled:
        controller.stop();
      case PullToRefreshIndicatorMode.armed:
      case PullToRefreshIndicatorMode.drag:
      default:
    }
    // logd('mode: ${info.mode}, dragOffset:${info.dragOffset}');

    return SizedBox(
      height: info.dragOffset ?? 0,
      child: Container(
        height: 64,
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/lottie/loading.json',
          height: 28,
          controller: controller,
          repeat: true,
        ),
      ),
    );
  }
}