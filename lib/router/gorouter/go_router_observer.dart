
import 'package:flutter/cupertino.dart';

class GoRouterPathObserver extends NavigatorObserver {
  void log(value) => debugPrint('MyNavObserver:$value');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => log(
      'didPush: ${route.settings.name.toString()}, previousRoute= ${previousRoute?.settings.name.toString()}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => log(
      'didPop: ${route.settings.name.toString()}, previousRoute= ${previousRoute?.settings.name.toString()}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => log(
      'didRemove: ${route.settings.name.toString()}, previousRoute= ${previousRoute?.settings.name.toString()}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) => log(
      'didReplace: new= ${newRoute?.settings.name.toString()}, old= ${oldRoute?.settings.name.toString()}');

  @override
  void didStartUserGesture(
      Route<dynamic> route,
      Route<dynamic>? previousRoute,
      ) =>
      log('didStartUserGesture: ${route.settings.name.toString()}, '
          'previousRoute= ${previousRoute?.settings.name.toString()}');

  @override
  void didStopUserGesture() => log('didStopUserGesture');
}