import 'package:express_app/router.dart';
import 'package:flutter/material.dart';

class Express extends InheritedWidget {
  final MaterialApp app;
  final ExpressRouter router;
  final Map<String, dynamic> parameters;

  Express(
    {
      @required this.router,
      this.parameters = const {},

      // Do not modify the routing attributes as they will be overriden
      @required this.app,
    }) : super(child: app) {
      this.router.init(app.home);
    }

  render() {
    return this;
  }

  onRouteGenerate() {
  }

  perform( BuildContext context, String action ) {
    Navigator.of(context).pushReplacement(router.perform(action));
  }

  static Express of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Express);
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
